export default function reducer(state = { orders: [] }, action) {
    switch(action.type) {
        case 'GET_ORDERS':
            return {...state, requesting: true}
        case 'ADD_ORDERS':
            return {...state, requesting: false, orders: action.orders}
        case 'CREATE_ORDER':
            return {...state, requesting: false, orders: [...state.orders, action.orderData]}
        case 'GET_SHIPMENTS':
            return {...state, requesting: true}
        case 'ADD_SHIPMENTS':
            return {...state, requesting: false, shipments: action.shipments}
        case 'CREATE_SHIPMENT':
            return {...state, requesting: false, shipments: [...state.shipments, action.shipmentData]}
        case 'GET_PRODUCTS':
            return {...state, requesting: true}
        case 'ADD_PRODUCTS':
            return {...state, requesting: false, products: action.products}
        case 'CREATE_PRODUCT':
            return {...state, requesting: false, products: [...state.products, action.productData]}
        case 'GET_VARIANTS':
            return {...state, requesting: true}
        case 'ADD_VARIANTS':
            return {...state, requesting: false, variants: action.variants}
        case 'CREATE_VARIANT':
            return {...state, requesting: false, variants: [...state.variants, action.variantData]}
        default:
            return state;
    }
}