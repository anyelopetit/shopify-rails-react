import React from 'react';
import { connect } from 'react-redux';

class OrdersContainer extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            orders: []
        }
    }

    componentDidMount() {
        console.log('OrdersContainer was mount')
    }

    render() {
        return(<h1>OrdersContainer</h1>)
    }
}

const mapStateToProps = state => {
    return { orders: state.orders };
}

const mapDispatchToProps = dispatch => {
    return {
        fetchOrders: () => dispatch()
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(OrdersContainer);