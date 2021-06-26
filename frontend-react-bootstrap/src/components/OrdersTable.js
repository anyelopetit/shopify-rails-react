import React from 'react';
import OrdersList from './OrdersList';
import { Container, Table } from 'react-bootstrap';

const OrdersTable = props => {
  if (props.orders) {
    return(
      <Container>
        <Table striped bordered hover>
          <thead>
            <th>ID</th>
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