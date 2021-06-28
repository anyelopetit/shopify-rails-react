import React from 'react';
import { Link } from 'react-router-dom';
import '@fortawesome/fontawesome-free-solid'

const VariantsList = props => {
  if (Array.isArray(props.variants)) {
    return (
      props.variants.map(variant => {
        return(
          <tr key={variant.id}>
            <td>{variant.id}</td>
            <td>{variant.title}</td>
            <td>{variant.price} {variant.currency}</td>
            <td>{variant.created_at}</td>
          </tr>
        )
      })
    )
  } else {
    return <div>No variants yet</div>
  }
}

export default VariantsList;