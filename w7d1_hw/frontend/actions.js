// const selectCurrency = function (baseCurrency, rates) {
//   return {
//     type: "Switch Currency",
//     baseCurrency: baseCurrency,
//     rates: rates
//   };
// };
//
// export default selectCurrency;
//

const selectCurrency = (baseCurrency, rates) => {
  return {
    type: "SWITCH_CURRENCY",
    baseCurrency: baseCurrency,
    rates: rates
  };
};

export default selectCurrency;
