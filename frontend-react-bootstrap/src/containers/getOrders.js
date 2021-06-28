const getOrders = () => {
  return (dispatch) => {
    dispatch({ type: 'GET_ORDERS'});
    fetch(`${process.env.REACT_APP_API_ROOT}/v1/orders`)
      .then(resp => resp.json())
      .then(data => {
        dispatch({ type: 'ADD_ORDERS', orders: data })
      })
  }
}

export default getOrders;