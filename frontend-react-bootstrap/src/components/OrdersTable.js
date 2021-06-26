import React from 'react';
import OrdersList from './OrdersList';
import { Container, Table, Jumbotron } from 'react-bootstrap';

const OrdersTable = props => {
  if (props.orders) {
    return(
      <Container>
        <Jumbotron fluid>
          <Container>
            <h1 className="mt-5">Orders</h1>
          </Container>
        </Jumbotron>
        <Table striped bordered hover>
          <thead>
            <th>ID</th>
            <th>Status</th>
            <th>Price</th>
            <th>Created</th>
          </thead>
          <tbody>
            <OrdersList orders={props.orders} />
          </tbody>
        </Table>
      </Container>
    )
  } else {
    return <div>No orders yet</div>
  }
}

export default OrdersTable;