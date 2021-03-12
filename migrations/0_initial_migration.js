const GZToken = artifacts.require("GZToken");

module.exports = function (deployer) {
  deployer.deploy(GZToken);
};
