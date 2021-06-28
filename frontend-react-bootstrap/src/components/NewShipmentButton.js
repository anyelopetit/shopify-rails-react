import React from 'react';
import getShipments from '../actions/getShipments'
import createShipment from '../actions/createShipment'
import { connect } from 'react-redux';
import { Link } from 'react-router-dom'
import { Button } from 'react-bootstrap'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

class NewShipmentButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      shipments: []
    }
  }

  componentDidMount() {
    this.props.getShipments(this.props.order_id);
  }

  handleSubmit = e => {
    e.preventDefault();
    const data = {
      order_id: e.target.querySelector('input[name="order_id"]').value
    }
    this.props.createShipment(data);
  }

  render() {
    if (Array.isArray(this.props.shipments)) {
      return(
        <Link to={'/orders/' + this.props.order_id + '/shipments'}>
          <Button variant="light" size="sm">
            <FontAwesomeIcon icon="eye" className="mx-1" />
            Show
          </Button>
        </Link>
      )
    }
    return (
      <>
        <form onSubmit={e => this.handleSubmit(e)}>
          <input type="hidden" name="order_id" value={this.props.order_id} />
          <input type="submit" className="btn btn-primary btn-sm" value="Deliver" />
        </form>
      </>
    )
  }
}

const mapStateToProps = state => {
  return { shipments: state.shipments };
}

const mapDispatchToProps = dispatch => {
  return {
    createShipment: (data) => dispatch(createShipment(data)),
    getShipments: (order_id) => dispatch(getShipments(order_id))
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(NewShipmentButton);