import React from 'react';
import ShipmentsList from './ShipmentsList';
import { Container, Row, Col, Jumbotron } from 'react-bootstrap';

const ShipmentsTable = props => {
  if (Array.isArray(props.shipments)) {
    return(
      <Container>
        <Jumbotron fluid>
          <Container>
            <Row>
              <Col className="d-flex">
                <h3 className="mt-5">
                  Shipments
                </h3>
              </Col>
            </Row>
          </Container>
        </Jumbotron>
        <ShipmentsList shipments={props.shipments} />
      </Container>
    )
  } else {
    return <h3>No shipments yet</h3>
  }
}

export default ShipmentsTable;