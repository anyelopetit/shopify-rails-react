const createOrder = data => {
  return (dispatch) => {
    dispatch({ type: 'GET_ORDERS' });
    fetch(`${process.env.REACT_APP_API_ROOT}/v1/orders`, {
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
    .then(orderData => {
      dispatch({ type: 'CREATE_ORDER', order: orderData })
    })
    .catch(err => console.log('error posting order', err));
  }
}

export default createOrder;
