import React from 'react';
import OrdersList from './OrdersList';
import { Container, Row, Col, Table, Jumbotron } from 'react-bootstrap';

const OrdersTable = props => {
  if (Array.isArray(props.orders)) {
    return(
      <Container>
        <Jumbotron fluid>
          <Container>
            <Row>
              <Col>
                <h3 className="mt-5 d-flex justify-content-between">
                  Orders
                </h3>
              </Col>
            </Row>
          </Container>
        </Jumbotron>
        <Table striped bordered hover>
          <thead>
            <tr>
              <th>ID</th>
              <th>Kind</th>
              <th>Reference</th>
              <th>Status</th>
              <th>Price</th>
              <th>Created</th>
              <th>Shipments</th>
            </tr>
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