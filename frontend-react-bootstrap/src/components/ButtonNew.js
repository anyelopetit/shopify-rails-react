import React from 'react';
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import '@fortawesome/fontawesome-free-solid'
import { Button } from 'react-bootstrap'

const ButtonNew = props => {
  return(
    <Link to={props.url}>
      <Button>
        <FontAwesomeIcon icon="plus" className="mx-2" />
        {props.text}
      </Button>
    </Link>
  )
}

export default ButtonNew;