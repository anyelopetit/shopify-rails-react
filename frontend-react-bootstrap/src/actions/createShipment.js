const createShipment = data => {
  return (dispatch) => {
    dispatch({ type: 'GET_SHIPMENTS' });
    fetch(`${process.env.REACT_APP_API_ROOT}/v1/orders/${data.order_id}/shipments`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: JSON.stringify(data)
    })
    .then(response => {
      return response.json();
    })
    .then(shipmentData => {
      dispatch({ type: 'CREATE_SHIPMENT', shipment: shipmentData })
    })
    .catch(err => console.log('error posting shipment', err));
  }
}

export default createShipment;
