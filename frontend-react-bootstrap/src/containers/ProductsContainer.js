import React from 'react';
import { connect } from 'react-redux';
import getProducts from '../actions/getProducts';
import ProductsTable from '../components/ProductsTable';

class ProductsContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: []
    }
  }

  componentDidMount() {
    this.props.getProducts();
  }

  render() {
    if (this.props.products) {
      return <ProductsTable products={this.props.products} />
    } else {
      return <h2>No products yet.</h2>
    }
  }
}

const mapStateToProps = state => {
  return { products: state.products };
}

const mapDispatchToProps = dispatch => {
  return {
    getProducts: () => dispatch(getProducts())
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(ProductsContainer);