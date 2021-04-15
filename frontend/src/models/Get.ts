//GET
const API_ANIMAL_EXHIBIT = async (setArr: any) => {
  const response = await fetch(`http://localhost:5050/animal-exhibit`);
  const data = await response.json();
  setArr(data.Results);
  return;
};
//Module Export
const _ = {
  API_ANIMAL_EXHIBIT,
};
export default _;
