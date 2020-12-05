module Shifter(dataA, dataB, Signal, dataOut);

input [31:0] dataA ;
input [4:0] dataB ;
input [5:0] Signal ;
output [31:0] dataOut ;

reg [31:0] zero = 32'b0;
reg [5:0] ctrl = 6'b100000;
reg [31:0] temp =32'b0 ;
parameter SLL = 6'b000000;

wire [31:0] s1 ;
wire [31:0] s2 ;
wire [31:0] s3 ;
wire [31:0] s4 ;
wire [31:0] s5 ;

// bit1
mux2X1  insert_031 (dataA[31],dataA[30],dataB[0],s1[31],Signal);
mux2X1  insert_030 (dataA[30],dataA[29],dataB[0],s1[30],Signal);
mux2X1  insert_029 (dataA[29],dataA[28],dataB[0],s1[29],Signal);
mux2X1  insert_028 (dataA[28],dataA[27],dataB[0],s1[28],Signal);
mux2X1  insert_027 (dataA[27],dataA[26],dataB[0],s1[27],Signal);
mux2X1  insert_026 (dataA[26],dataA[25],dataB[0],s1[26],Signal);
mux2X1  insert_025 (dataA[25],dataA[24],dataB[0],s1[25],Signal);
mux2X1  insert_024 (dataA[24],dataA[23],dataB[0],s1[24],Signal);
mux2X1  insert_023 (dataA[23],dataA[22],dataB[0],s1[23],Signal);
mux2X1  insert_022 (dataA[22],dataA[21],dataB[0],s1[22],Signal);
mux2X1  insert_021 (dataA[21],dataA[20],dataB[0],s1[21],Signal);
mux2X1  insert_020 (dataA[20],dataA[19],dataB[0],s1[20],Signal);
mux2X1  insert_019 (dataA[19],dataA[18],dataB[0],s1[19],Signal);
mux2X1  insert_018 (dataA[18],dataA[17],dataB[0],s1[18],Signal);
mux2X1  insert_017 (dataA[17],dataA[16],dataB[0],s1[17],Signal);
mux2X1  insert_016 (dataA[16],dataA[15],dataB[0],s1[16],Signal);
mux2X1  insert_015 (dataA[15],dataA[14],dataB[0],s1[15],Signal);
mux2X1  insert_014 (dataA[14],dataA[13],dataB[0],s1[14],Signal);
mux2X1  insert_013 (dataA[13],dataA[12],dataB[0],s1[13],Signal);
mux2X1  insert_012 (dataA[12],dataA[11],dataB[0],s1[12],Signal);
mux2X1  insert_011 (dataA[11],dataA[10],dataB[0],s1[11],Signal);
mux2X1  insert_010 (dataA[10],dataA[9],dataB[0],s1[10],Signal);
mux2X1  insert_009 (dataA[9],dataA[8],dataB[0],s1[9],Signal);
mux2X1  insert_008 (dataA[8],dataA[7],dataB[0],s1[8],Signal);
mux2X1  insert_007 (dataA[7],dataA[6],dataB[0],s1[7],Signal);
mux2X1  insert_006 (dataA[6],dataA[5],dataB[0],s1[6],Signal);
mux2X1  insert_005 (dataA[5],dataA[4],dataB[0],s1[5],Signal);
mux2X1  insert_004 (dataA[4],dataA[3],dataB[0],s1[4],Signal);
mux2X1  insert_003 (dataA[3],dataA[2],dataB[0],s1[3],Signal);
mux2X1  insert_002 (dataA[2],dataA[1],dataB[0],s1[2],Signal);
mux2X1  insert_001 (dataA[1],dataA[0],dataB[0],s1[1],Signal);
mux2X1  insert_000 (dataA[0],1'b0,dataB[0],s1[0],Signal);

 // 2 bit
mux2X1  insert_131 (s1[31],s1[29],dataB[1],s2[31],Signal);
mux2X1  insert_130 (s1[30],s1[28],dataB[1],s2[30],Signal);
mux2X1  insert_129 (s1[29],s1[27],dataB[1],s2[29],Signal);
mux2X1  insert_128 (s1[28],s1[26],dataB[1],s2[28],Signal);
mux2X1  insert_127 (s1[27],s1[25],dataB[1],s2[27],Signal);
mux2X1  insert_126 (s1[26],s1[24],dataB[1],s2[26],Signal);
mux2X1  insert_125 (s1[25],s1[23],dataB[1],s2[25],Signal);
mux2X1  insert_124 (s1[24],s1[22],dataB[1],s2[24],Signal);
mux2X1  insert_123 (s1[23],s1[21],dataB[1],s2[23],Signal);
mux2X1  insert_122 (s1[22],s1[20],dataB[1],s2[22],Signal);
mux2X1  insert_121 (s1[21],s1[19],dataB[1],s2[21],Signal);
mux2X1  insert_120 (s1[20],s1[18],dataB[1],s2[20],Signal);
mux2X1  insert_119 (s1[19],s1[17],dataB[1],s2[19],Signal);
mux2X1  insert_118 (s1[18],s1[16],dataB[1],s2[18],Signal);
mux2X1  insert_117 (s1[17],s1[15],dataB[1],s2[17],Signal);
mux2X1  insert_116 (s1[16],s1[14],dataB[1],s2[16],Signal);
mux2X1  insert_115 (s1[15],s1[13],dataB[1],s2[15],Signal);
mux2X1  insert_114 (s1[14],s1[12],dataB[1],s2[14],Signal);
mux2X1  insert_113 (s1[13],s1[11],dataB[1],s2[13],Signal);
mux2X1  insert_112 (s1[12],s1[10],dataB[1],s2[12],Signal);
mux2X1  insert_111 (s1[11],s1[9],dataB[1],s2[11],Signal);
mux2X1  insert_110 (s1[10],s1[8],dataB[1],s2[10],Signal);
mux2X1  insert_109 (s1[9],s1[7],dataB[1],s2[9],Signal);
mux2X1  insert_108 (s1[8],s1[6],dataB[1],s2[8],Signal);
mux2X1  insert_107 (s1[7],s1[5],dataB[1],s2[7],Signal);
mux2X1  insert_106 (s1[6],s1[4],dataB[1],s2[6],Signal);
mux2X1  insert_105 (s1[5],s1[3],dataB[1],s2[5],Signal);
mux2X1  insert_104 (s1[4],s1[2],dataB[1],s2[4],Signal);
mux2X1  insert_103 (s1[3],s1[1],dataB[1],s2[3],Signal);
mux2X1  insert_102 (s1[2],s1[0],dataB[1],s2[2],Signal);
mux2X1  insert_101 (s1[1],1'b0,dataB[1],s2[1],Signal);
mux2X1  insert_100 (s1[0],1'b0,dataB[1],s2[0],Signal);

//4bit 
mux2X1  insert_231 (s2[31],s2[27],dataB[2],s3[31],Signal);
mux2X1  insert_230 (s2[30],s2[26],dataB[2],s3[30],Signal);
mux2X1  insert_229 (s2[29],s2[25],dataB[2],s3[29],Signal);
mux2X1  insert_228 (s2[28],s2[24],dataB[2],s3[28],Signal);
mux2X1  insert_227 (s2[27],s2[23],dataB[2],s3[27],Signal);
mux2X1  insert_226 (s2[26],s2[22],dataB[2],s3[26],Signal);
mux2X1  insert_225 (s2[25],s2[21],dataB[2],s3[25],Signal);
mux2X1  insert_224 (s2[24],s2[20],dataB[2],s3[24],Signal);
mux2X1  insert_223 (s2[23],s2[19],dataB[2],s3[23],Signal);
mux2X1  insert_222 (s2[22],s2[18],dataB[2],s3[22],Signal);
mux2X1  insert_221 (s2[21],s2[17],dataB[2],s3[21],Signal);
mux2X1  insert_220 (s2[20],s2[16],dataB[2],s3[20],Signal);
mux2X1  insert_219 (s2[19],s2[15],dataB[2],s3[19],Signal);
mux2X1  insert_218 (s2[18],s2[14],dataB[2],s3[18],Signal);
mux2X1  insert_217 (s2[17],s2[13],dataB[2],s3[17],Signal);
mux2X1  insert_216 (s2[16],s2[12],dataB[2],s3[16],Signal);
mux2X1  insert_215 (s2[15],s2[11],dataB[2],s3[15],Signal);
mux2X1  insert_214 (s2[14],s2[10],dataB[2],s3[14],Signal);
mux2X1  insert_213 (s2[13],s2[9],dataB[2],s3[13],Signal);
mux2X1  insert_212 (s2[12],s2[8],dataB[2],s3[12],Signal);
mux2X1  insert_211 (s2[11],s2[7],dataB[2],s3[11],Signal);
mux2X1  insert_210 (s2[10],s2[6],dataB[2],s3[10],Signal);
mux2X1  insert_209 (s2[9],s2[5],dataB[2],s3[9],Signal);
mux2X1  insert_208 (s2[8],s2[4],dataB[2],s3[8],Signal);
mux2X1  insert_207 (s2[7],s2[3],dataB[2],s3[7],Signal);
mux2X1  insert_206 (s2[6],s2[2],dataB[2],s3[6],Signal);
mux2X1  insert_205 (s2[5],s2[1],dataB[2],s3[5],Signal);
mux2X1  insert_204 (s2[4],s2[0],dataB[2],s3[4],Signal);
mux2X1  insert_203 (s2[3],1'b0,dataB[2],s3[3],Signal);
mux2X1  insert_202 (s2[2],1'b0,dataB[2],s3[2],Signal);
mux2X1  insert_201 (s2[1],1'b0,dataB[2],s3[1],Signal);
mux2X1  insert_200 (s2[0],1'b0,dataB[2],s3[0],Signal);

//8bit
mux2X1  insert_331 (s3[31],s3[23],dataB[3],s4[31],Signal);
mux2X1  insert_330 (s3[30],s3[22],dataB[3],s4[30],Signal);
mux2X1  insert_329 (s3[29],s3[21],dataB[3],s4[29],Signal);
mux2X1  insert_328 (s3[28],s3[20],dataB[3],s4[28],Signal);
mux2X1  insert_327 (s3[27],s3[19],dataB[3],s4[27],Signal);
mux2X1  insert_326 (s3[26],s3[18],dataB[3],s4[26],Signal);
mux2X1  insert_325 (s3[25],s3[17],dataB[3],s4[25],Signal);
mux2X1  insert_324 (s3[24],s3[16],dataB[3],s4[24],Signal);
mux2X1  insert_323 (s3[23],s3[15],dataB[3],s4[23],Signal);
mux2X1  insert_322 (s3[22],s3[14],dataB[3],s4[22],Signal);
mux2X1  insert_321 (s3[21],s3[13],dataB[3],s4[21],Signal);
mux2X1  insert_320 (s3[20],s3[12],dataB[3],s4[20],Signal);
mux2X1  insert_319 (s3[19],s3[11],dataB[3],s4[19],Signal);
mux2X1  insert_318 (s3[18],s3[10],dataB[3],s4[18],Signal);
mux2X1  insert_317 (s3[17],s3[9],dataB[3],s4[17],Signal);
mux2X1  insert_316 (s3[16],s3[8],dataB[3],s4[16],Signal);
mux2X1  insert_315 (s3[15],s3[7],dataB[3],s4[15],Signal);
mux2X1  insert_314 (s3[14],s3[6],dataB[3],s4[14],Signal);
mux2X1  insert_313 (s3[13],s3[5],dataB[3],s4[13],Signal);
mux2X1  insert_312 (s3[12],s3[4],dataB[3],s4[12],Signal);
mux2X1  insert_311 (s3[11],s3[3],dataB[3],s4[11],Signal);
mux2X1  insert_310 (s3[10],s3[2],dataB[3],s4[10],Signal);
mux2X1  insert_309 (s3[9],s3[1],dataB[3],s4[9],Signal);
mux2X1  insert_308 (s3[8],s3[0],dataB[3],s4[8],Signal);
mux2X1  insert_307 (s3[7],1'b0,dataB[3],s4[7],Signal);
mux2X1  insert_306 (s3[6],1'b0,dataB[3],s4[6],Signal);
mux2X1  insert_305 (s3[5],1'b0,dataB[3],s4[5],Signal);
mux2X1  insert_304 (s3[4],1'b0,dataB[3],s4[4],Signal);
mux2X1  insert_303 (s3[3],1'b0,dataB[3],s4[3],Signal);
mux2X1  insert_302 (s3[2],1'b0,dataB[3],s4[2],Signal);
mux2X1  insert_301 (s3[1],1'b0,dataB[3],s4[1],Signal);
mux2X1  insert_300 (s3[0],1'b0,dataB[3],s4[0],Signal);

//16bit 
mux2X1  insert_431 (s4[31],s4[15],dataB[4],s5[31],Signal);
mux2X1  insert_430 (s4[30],s4[14],dataB[4],s5[30],Signal);
mux2X1  insert_429 (s4[29],s4[13],dataB[4],s5[29],Signal);
mux2X1  insert_428 (s4[28],s4[12],dataB[4],s5[28],Signal);
mux2X1  insert_427 (s4[27],s4[11],dataB[4],s5[27],Signal);
mux2X1  insert_426 (s4[26],s4[10],dataB[4],s5[26],Signal);
mux2X1  insert_425 (s4[25],s4[9],dataB[4],s5[25],Signal);
mux2X1  insert_424 (s4[24],s4[8],dataB[4],s5[24],Signal);
mux2X1  insert_423 (s4[23],s4[7],dataB[4],s5[23],Signal);
mux2X1  insert_422 (s4[22],s4[6],dataB[4],s5[22],Signal);
mux2X1  insert_421 (s4[21],s4[5],dataB[4],s5[21],Signal);
mux2X1  insert_420 (s4[20],s4[4],dataB[4],s5[20],Signal);
mux2X1  insert_419 (s4[19],s4[3],dataB[4],s5[19],Signal);
mux2X1  insert_418 (s4[18],s4[2],dataB[4],s5[18],Signal);
mux2X1  insert_417 (s4[17],s4[1],dataB[4],s5[17],Signal);
mux2X1  insert_416 (s4[16],s4[0],dataB[4],s5[16],Signal);
mux2X1  insert_415 (s4[15],1'b0,dataB[4],s5[15],Signal);
mux2X1  insert_414 (s4[14],1'b0,dataB[4],s5[14],Signal);
mux2X1  insert_413 (s4[13],1'b0,dataB[4],s5[13],Signal);
mux2X1  insert_412 (s4[12],1'b0,dataB[4],s5[12],Signal);
mux2X1  insert_411 (s4[11],1'b0,dataB[4],s5[11],Signal);
mux2X1  insert_410 (s4[10],1'b0,dataB[4],s5[10],Signal);
mux2X1  insert_409 (s4[9],1'b0,dataB[4],s5[9],Signal);
mux2X1  insert_408 (s4[8],1'b0,dataB[4],s5[8],Signal);
mux2X1  insert_407 (s4[7],1'b0,dataB[4],s5[7],Signal);
mux2X1  insert_406 (s4[6],1'b0,dataB[4],s5[6],Signal);
mux2X1  insert_405 (s4[5],1'b0,dataB[4],s5[5],Signal);
mux2X1  insert_404 (s4[4],1'b0,dataB[4],s5[4],Signal);
mux2X1  insert_403 (s4[3],1'b0,dataB[4],s5[3],Signal);
mux2X1  insert_402 (s4[2],1'b0,dataB[4],s5[2],Signal);
mux2X1  insert_401 (s4[1],1'b0,dataB[4],s5[1],Signal);
mux2X1  insert_400 (s4[0],1'b0,dataB[4],s5[0],Signal);
/*
移位器運算
*/

assign dataOut = (dataB >= ctrl)? zero :s5 ;
/*
=====================================================
上面為模擬範例，程式撰寫請遵照老師上課說明的方法來寫
=====================================================
*/

endmodule