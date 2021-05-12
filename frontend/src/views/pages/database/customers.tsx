import { useEffect, useState } from "react";
import * as API_GET from "../../../models/GET/Get";
import * as API_PUT from "../../../models/PUT/Put";
import * as API_DELETE from "../../../models/DELETE/delete";
import * as API_POST from "../../../models/POST/post";
import { Formik, Field, Form } from "formik";

const Customers = () => {
  const [dbResults, setdbResults] = useState<any>(null);
  useEffect(() => {
    //READ
    API_GET.default.GET_CUSTOMERS(setdbResults);
  }, []);

  const listItems =
    dbResults == null ? (
      <li>Loading Data</li>
    ) : (
      dbResults.map((data: any) => (
        <div key={data.customer_id}>
          <hr></hr>
          <Formik
            initialValues={{
              customer_id: "",
              name: "",
              phone: "",
              email_addr: "",
              delete: 0,
            }}
            onSubmit={async (values) => {
              console.log(values);
              switch (values.delete) {
                //UPDATE
                case 0:
                  const response: any = await API_PUT.default.PUT_CUSTOMER(values);
                  if (response.status === 200) {
                    let res = await response.text();
                    alert(res);
                  }
                  if (response.status === 400) {
                    let err = await response.text();
                    alert(err);
                  }
                  break;
                //DELETE
                case 1:
                  const response_v2: any = await API_DELETE.default.DELETE_CUSTOMER(values);
                  if (response_v2.status === 200) {
                    let res = await response_v2.text();
                    alert(res);
                  }
                  if (response_v2.status === 400) {
                    let err = await response_v2.text();
                    alert(err);
                  }
                  break;
                //CREATE
                case 2:
                  const response_v3: any = await API_POST.default.POST_CUSTOMER(values);
                  if (response_v3.status === 200) {
                    let res = await response_v3.text();
                    alert(res);
                  }
                  if (response_v3.status === 400) {
                    let err = await response_v3.text();
                    alert(err);
                  }
                  break;
              }
            }}
          >
            <Form>
              <label>Customer ID</label>
              <Field id="customer_id" name="customer_id" type="number" placeholder={data.customer_id} />
              <label>Customer Name</label>
              <Field id="name" name="name" type="text" placeholder={data.name} />
              <label>Phone Number</label>
              <Field id="phone" name="phone" type="number" placeholder={data.phone} />
              <label>Email</label>
              <Field id="email_addr" name="email_addr" type="text" placeholder={data.email_addr} />
              <label>Delete(Y\N)</label>
              <Field id="delete" name="delete" type="number" placeholder={0} />
              <label>Create(Y\N)</label>
              <Field id="delete" name="delete" type="number" placeholder={0} />
              <button type="submit">Submit</button>
            </Form>
          </Formik>
        </div>
      ))
    );
  return (
    <div>
      <h3>Customers</h3>
      {listItems}
    </div>
  );
};

export default Customers;
