//GET Animals in Exhibit
const GET_ANIMALS = async (setArr: any) => {
  const response = await fetch(`http://localhost:5050/animal-exhibit`);
  const data = await response.json();
  setArr(data.Results);
  return;
};
//GET: Customers
const GET_CUSTOMERS = async (setArr: any) => {
  const response = await fetch(`http://localhost:5050/db_customers`);
  const data: any = await response.json();
  setArr(data.Results);
  return;
};
//Module Export
const _ = {
  GET_ANIMALS,
  GET_CUSTOMERS,
};
export default _;
