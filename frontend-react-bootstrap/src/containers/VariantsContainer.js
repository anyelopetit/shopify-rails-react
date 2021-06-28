import React from 'react';
import { connect } from 'react-redux';
import getVariants from '../actions/getVariants';
import VariantsTable from '../components/VariantsTable';

class VariantsContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      variants: []
    }
  }

  componentDidMount() {
    this.product_id = this.props.match.params.product_id
    this.props.getVariants(this.product_id);
  }

  render() {
    if (this.props.variants) {
      return <VariantsTable product_id={this.product_id} variants={this.props.variants} />
    } else {
      return <h2>No variants yet.</h2>
    }
  }
}

const mapStateToProps = state => {
  return { variants: state.variants };
}

const mapDispatchToProps = dispatch => {
  return {
    getVariants: (product_id) => dispatch(getVariants(product_id))
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(VariantsContainer);