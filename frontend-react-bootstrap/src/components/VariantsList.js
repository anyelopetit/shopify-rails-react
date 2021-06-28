import React from 'react';
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import '@fortawesome/fontawesome-free-solid'

const VariantsList = props => {
  if (Array.isArray(props.variantts)) {
    return (
      props.variantts.map(variantt => {
        return(
          <tr key={variantt.id}>
            <td>
              <Link to={"/variantts/" + variantt.id}>
                {variantt.id}
              </Link>
            </td>
            <td>
              <a href={process.env.REACT_APP_SHOPIFY_ROOT + '/variantts/' + variantt.shopify_id + '.json'} target="_blank" rel="noreferrer">
                {variantt.kind}
                <FontAwesomeIcon icon={['fas', "external-link-square-alt"]} className="mx-1" />
              </a>
            </td>
            <td>
              {variantt.reference}
            </td>
            <td>{variantt.status}</td>
            <td>{variantt.total_price} {variantt.currency}</td>
            <td>{variantt.created_at}</td>
          </tr>
        )
      })
    )
  } else {
    return <div>No variantts yet</div>
  }
}

export default VariantsList;