const getVariants = (product_id) => {
  return (dispatch) => {
    dispatch({ type: 'GET_VARIANTS'});
    fetch(`${process.env.REACT_APP_API_ROOT}/v1/products/${product_id}/variants`)
      .then(resp => resp.json())
      .then(data => {
        dispatch({ type: 'ADD_VARIANTS', variants: data })
      })
  }
}

export default getVariants;