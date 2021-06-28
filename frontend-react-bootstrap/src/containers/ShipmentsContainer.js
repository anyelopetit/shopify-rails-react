import React from 'react';
import { connect } from 'react-redux';
import getShipments from '../actions/getShipments';
import ShipmentsTable from '../components/ShipmentsTable';

class ShipmentsContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      shipments: []
    }
  }

  componentDidMount() {
    this.order_id = this.props.match.params.order_id
    this.props.getShipments(this.order_id);
  }

  render() {
    if (this.props.shipments) {
      return <ShipmentsTable shipments={this.props.shipments} />
    } else {
      return <h2>No shipments yet.</h2>
    }
  }
}

const mapStateToProps = state => {
  return { shipments: state.shipments };
}

const mapDispatchToProps = dispatch => {
  return {
    getShipments: (order_id) => dispatch(getShipments(order_id))
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(ShipmentsContainer);