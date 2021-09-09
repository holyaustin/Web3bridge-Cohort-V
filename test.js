const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Admission contract", function () {
  let adm, owner, addr1, addr2, addr3;
  beforeEach(async function () {
   // const signers = await ethers.getSigners();
    //addr1 = signers[0];
    //addr2 = signers[1];
    //addr3 = signers[2];
    const Admission = await ethers.getContractFactory("studentAdmission");
    [owner, addr1, addr2, addr3] = await ethers.getSigners();
    adm = await Admission.deploy();
    //await adm.deployed();
  });
  describe("Deployment", function () {
    it("Should set the right owner", async function () {
      expect(await adm.owner()).to.equal(owner.address);
    });
    it("Assignment of token to owner", async function () {
      const ownerBalance = await adm.balanceOf(owner.address);
      expect(await adm.balanceOf(owner.address)).to.equal(500000);
    });
    it("Should return the correct Charge and counter state", async function () {
      expect(await adm.admissionCharge()).to.equal(2);
      expect(await adm.counter()).to.equal(0);
    });
  });
});
