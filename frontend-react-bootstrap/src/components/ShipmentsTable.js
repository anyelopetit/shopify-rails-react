import React from 'react';
import ShipmentsList from './ShipmentsList';
import { Container, Row, Col, Table, Jumbotron } from 'react-bootstrap';

const ShipmentsTable = props => {
  if (Array.isArray(props.shipments)) {
    return(
      <Container>
        <Jumbotron fluid>
          <Container>
            <Row>
              <Col>
                <h1 className="mt-5 d-flex justify-content-between">
                  Shipments
                </h1>
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
            </tr>
          </thead>
          <tbody>
            <ShipmentsList shipments={props.shipments} />
          </tbody>
        </Table>
      </Container>
    )
  } else {
    return <h3>No shipments yet</h3>
  }
}

export default ShipmentsTable;