const Migrations = artifacts.require("Migrations");

const Social = artifacts.require("Social");

module.exports = async function (deployer) {

  await deployer.deploy(Migrations);

  await deployer.deploy(Social);

};
