/* Quartus Prime Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(SOCVHPS) MfrSpec(OpMask(0));
	P ActionCode(Cfg)
		Device PartName(5CSEMA5) Path("C:/Projects/360 Systems/DE1 FPGA board/DE1_SOC_Linux_FB-master/git/DE1_SOC_Linux_FB/") File("DE1_SOC_Linux_FB.jic") MfrSpec(OpMask(1) SEC_Device(EPCS128) Child_OpMask(1 3));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
