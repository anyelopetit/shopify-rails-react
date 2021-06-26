export default function reducer(state = { orders: [] }, action) {
    switch(action.type) {
        case 'GET_ORDERS':
            return {...state, requesting: true}
        case 'ADD_ORDERS':
            return {...state, requesting: false, orders: action.orders}
        default:
            return state;
    }
}