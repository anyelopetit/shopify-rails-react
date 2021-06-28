import React from 'react';
import { Table } from 'react-bootstrap';
import '@fortawesome/fontawesome-free-solid'

const ShipmentsList = props => {
  if (Array.isArray(props.shipments)) {
    return (
      props.shipments.map(shipment => {
        return(
          <>
            <h3>Order Info</h3>

            <Table striped bordered hover>
              <thead>
                <tr>
                  <th>Payment</th>
                  <th>Kind</th>
                  <th>Reference</th>
                  <th>Items</th>
                  <th>Courier</th>
                </tr>
              </thead>
              <tbody>
                <tr key={shipment.order.id}>
                  <td key="order-payment">
                    {shipment.order.payment.status}
                  </td>
                  <td key="order-kind">
                    {shipment.order.kind}
                  </td>
                  <td key="order-reference">
                    {shipment.order.reference}
                  </td>
                  <td key="order-items">
                    {shipment.order.items}
                  </td>
                  <td key="order-courier">
                    {shipment.order.courier}
                  </td>
                </tr>
              </tbody>
            </Table>

            <h3>Origin</h3>

            <Table striped bordered hover>
              <thead>
                <tr>
                  <th>Email</th>
                  <th>Phone</th>
                  <th>Street</th>
                  <th>Commune ID</th>
                  <th>Number</th>
                  <th>Complement</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td key="destiny-email">
                    {shipment.destiny.email}
                  </td>
                  <td key="destiny-phone">
                    {shipment.destiny.phone}
                  </td>
                  <td key="destiny-street">
                    {shipment.destiny.street}
                  </td>
                  <td key="destiny-commune_id">
                    {shipment.destiny.commune_id}
                  </td>
                  <td key="destiny-number">
                    {shipment.destiny.number}
                  </td>
                  <td key="destiny-complement">
                    {shipment.destiny.complement}
                  </td>
                </tr>
              </tbody>
            </Table>

            <h3>Destiny</h3>

            <Table striped bordered hover>
              <thead>
                <tr>
                  <th>Email</th>
                  <th>Phone</th>
                  <th>Street</th>
                  <th>Commune ID</th>
                  <th>Number</th>
                  <th>Complement</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td key="origin-email">
                    {shipment.origin.email}
                  </td>
                  <td key="origin-phone">
                    {shipment.origin.phone}
                  </td>
                  <td key="origin-street">
                    {shipment.origin.street}
                  </td>
                  <td key="origin-commune_id">
                    {shipment.origin.commune_id}
                  </td>
                  <td key="origin-number">
                    {shipment.origin.number}
                  </td>
                  <td key="origin-complement">
                    {shipment.origin.complement}
                  </td>
                </tr>
              </tbody>
            </Table>
          </>
        )
      })
    )
  } else {
    return <div>No shipments yet</div>
  }
}

export default ShipmentsList;