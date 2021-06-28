import React from 'react';
import { Link } from 'react-router-dom';
import '@fortawesome/fontawesome-free-solid'
import { Button } from 'react-bootstrap'

const ProductsList = props => {
  if (Array.isArray(props.products)) {
    return (
      props.products.map(product => {
        return(
          <tr key={product.id}>
            <td>{product.id}</td>
            <td>{product.title}</td>
            <td>{product.vendor}</td>
            <td>{product.product_type}</td>
            <td>{product.status}</td>
            <td>{product.created_at}</td>
            <td>
              <Link to={'/products/' + product.id + '/variants'}>
                <Button size="sm">
                  {product.variants.size} variants
                </Button>
              </Link>
            </td>
          </tr>
        )
      })
    )
  } else {
    return <tr><td colSpan="7">No products yet</td></tr>
  }
}

export default ProductsList;