const getShipments = (order_id) => {
  return (dispatch) => {
    dispatch({ type: 'GET_SHIPMENTS'});
    fetch(`${process.env.REACT_APP_API_ROOT}/v1/orders/${order_id}/shipments`)
      .then(resp => resp.json())
      .then(data => {
        dispatch({ type: 'ADD_SHIPMENTS', shipments: data })
      })
  }
}

export default getShipments;