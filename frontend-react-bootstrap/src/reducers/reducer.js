export default function reducer(state = { orders: [] }, action) {
    switch(action.type) {
        case 'START_FETCHING_ORDERS':
            return {...state, requesting: true}
        default:
            return state;
    }
}