const getProducts = () => {
  return (dispatch) => {
    dispatch({ type: 'GET_PRODUCTS'});
    fetch(`${process.env.REACT_APP_API_ROOT}/v1/products`)
      .then(resp => resp.json())
      .then(data => {
        dispatch({ type: 'ADD_PRODUCTS', products: data })
      })
  }
}

export default getProducts;