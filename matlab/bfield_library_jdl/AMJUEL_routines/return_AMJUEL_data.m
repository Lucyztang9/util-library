function data= return_AMJUEL_data

%--------------------------------------------------------------------------
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%--------------------------------------------------------------------------
% H.4 Reaction 2.1.5JH
d_raw = [...
0   -3.292647100524D+01    1.293481375348D-02    5.517562508468D-03
1    1.423977672396D+01   -1.173143955186D-02    1.063440108279D-03
2   -6.519438729039D+00   -7.189825749516D-03    9.247377414923D-04
3    2.009996151806D+00    1.275979740638D-02   -4.693479616874D-03
4   -4.289594424073D-01   -5.340866322754D-03    2.324582357388D-03
5    6.047834607038D-02    9.624900593359D-04   -4.182981184259D-04
6   -5.304737965836D-03   -7.854872454067D-05    2.735823803201D-05
7    2.606946949696D-04    2.317442253442D-06    5.148890779990D-08
8   -5.467903073834D-06    6.077380038450D-09   -4.712893073569D-08
0   -7.853816321645D-04    1.436128501544D-04   -3.883750282085D-07
1   -1.600053527730D-03    1.136554639958D-05    5.177662275946D-05
2    2.037026745547D-03   -3.668717204076D-04    5.368630315837D-06
3   -2.389224140310D-05    1.358069915666D-04   -1.454897555460D-05
4   -3.217228075879D-04    6.660581406632D-06    2.396531874534D-06
5    7.957230182146D-05   -7.447042563915D-06    1.849155263575D-07
6   -5.915348564130D-06    8.666302868477D-07   -6.115514821045D-08
7   -7.144182523188D-09   -2.540194754187D-08    4.097857835689D-09
8    1.086858755070D-08   -3.448417246175D-10   -8.714183216468D-11
0   -1.489774355194D-06    1.416361431167D-07   -3.890932078762D-09
1   -7.947999902838D-06    4.508505683240D-07   -8.952614093357D-09
2    3.713958914062D-06   -3.125764373429D-07    7.451213220623D-09
3    4.212031496989D-08    5.506044670830D-08   -1.852677638893D-09
4   -1.785208321244D-07    6.095649574151D-10    1.470204228549D-10
5    1.618233640838D-08   -8.182928298434D-10    4.835789623340D-12
6    1.075473174260D-09    4.118000674849D-11   -1.089323091222D-12
7   -2.048657335774D-10    3.027916374251D-12    1.155854020410D-14
8    8.023660696154D-12   -2.396518500447D-13    2.173645280354D-15];
data.H4.reaction_215JH = remap_d_raw(d_raw);


%--------------------------------------------------------------------------
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%--------------------------------------------------------------------------
% H.4 Reaction 2.1.5  
d_raw = [...
0   -3.247558607570D+01   -5.215105933178D-02    7.941731444770D-02
1    1.429292137400D+01   -8.294098833564D-03   -4.999669439710D-03
2   -6.811273308698D+00    8.741093660127D-03    6.520220765574D-02
3    2.295903318120D+00   -5.624692436832D-02   -5.196742223452D-02
4   -5.844392646989D-01    5.849672749369D-02    9.183051680958D-03
5    1.077715727854D-01   -2.391107770155D-02    1.942686602489D-03
6   -1.327395599924D-02    4.702819017480D-03   -8.210113480176D-04
7    9.574373842076D-04   -4.464929822969D-04    9.206450263638D-05
8   -3.016174850805D-05    1.644082355476D-05   -3.344797809047D-06
0   -3.403721523307D-02    7.401941661518D-03   -8.661631790226D-04
1   -1.031966091300D-02    4.528366365506D-03   -7.394855074451D-04
2   -1.529360994062D-02   -1.688535176892D-04    3.349139802682D-04
3    2.011929735347D-02   -2.250852635908D-03    5.897380805630D-05
4   -6.516840255618D-03    8.423647615240D-04   -3.386955200737D-05
5    6.753862397517D-04   -9.221734618706D-05    8.493132451168D-07
6    1.541888495392D-05    9.242639317836D-07    4.643962183032D-07
7   -4.810708869305D-06   -1.276609712840D-07    3.083422107953D-08
8    6.459840951068D-08    4.690696146605D-08   -7.665577999376D-09
0    5.557101099215D-05   -1.803343219897D-06    2.285623455979D-08
1    5.754064804422D-05   -2.167934749708D-06    3.184747299704D-08
2   -3.511866785815D-05    1.437837355279D-06   -2.108524853353D-08
3    4.734648449170D-06   -3.072956522360D-07    4.781746093292D-09
4   -4.287117610665D-07    5.194001321293D-08   -7.109916187966D-10
5    3.075260508511D-07   -1.219185437626D-08    8.931936545008D-11
6   -4.076028811764D-08    5.211320460225D-10    1.621365651477D-11
7   -4.139200632294D-09    2.876466369230D-10   -6.673126112916D-12
8    6.490132948929D-10   -2.901852297568D-11    5.128957534143D-13];
data.H4.reaction_215 = remap_d_raw(d_raw);


%--------------------------------------------------------------------------
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%--------------------------------------------------------------------------
% H.4 Reaction 2.1.8 -->Sawada rad+3body effective recombination rate
d_raw = [...
0   -2.859173412090D+01   -1.661007811717D-03    1.800123869432D-02
1   -7.727897152963D-01   -7.185510516868D-03   -6.664735116824D-03
2    2.731740252417D-04    1.841463674641D-02   -1.042796032026D-02
3   -9.412381843177D-03   -8.325885755900D-03    6.197039066476D-03
4    1.564398998662D-03   -1.001077253771D-03    1.281843907383D-03
5   -3.875231655429D-04    8.967038573752D-04   -9.737851139343D-04
6    5.743703850623D-05   -5.709392754051D-05    7.831607832493D-05
7   -3.896462887932D-06   -1.728485488993D-05    1.504835319823D-05
8    8.168921109996D-08    1.789661999688D-06   -1.723007265214D-06
0   -5.901319721407D-03    1.008884427267D-03   -7.666468567133D-05
1    1.025718155555D-03   -2.371359765453D-05   -2.379761249077D-05
2    3.793816747821D-03   -5.381919535018D-04    2.996223783421D-05
3   -2.288446843140D-03    3.612389570540D-04   -2.632269904386D-05
4   -3.969582319908D-04    5.662371262429D-05   -3.470227226116D-06
5    3.466635482442D-04   -5.542034883238D-05    4.167611128622D-06
6   -2.931850335332D-05    4.165929395282D-06   -1.833910759412D-07
7   -5.498262806478D-06    1.109375120018D-06   -1.305413093317D-07
8    6.441246925770D-07   -1.229576937590D-07    1.308011799197D-08
0    1.997734434786D-06    5.093156468064D-08   -2.546978246800D-09
1    3.017661441193D-06   -1.459838627412D-07    2.519490281465D-09
2    3.746085786687D-07   -9.615385988357D-08    2.492563949079D-09
3    6.689181198740D-07    1.133271905873D-08   -5.680616540286D-10
4    1.907348094032D-08    6.472160529017D-09   -1.931397945496D-10
5   -1.201431943086D-07   -7.335510423575D-10    6.808738180475D-11
6   -8.594650668059D-09    9.039128783831D-10   -1.825430199313D-11
7    8.728480804730D-09   -2.967440451300D-10    3.804314675048D-12
8   -7.784991698470D-10    2.376732432651D-11   -2.798033819072D-13];
data.H4.reaction_218 = remap_d_raw(d_raw);

%--------------------------------------------------------------------------
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%--------------------------------------------------------------------------
% H.4 Reaction 2.2.5 -->Sawada H2 dissociation multistep model
d_raw = [...
0   -2.748251723699D+01    5.245554722385D-04   -2.978103958861D-04
1    1.032713102402D+01   -4.288853521030D-04   -4.899568733097D-04
2   -5.042872981718D+00    2.836621770958D-03   -3.043912367565D-03
3    1.608638174175D+00   -1.261120000328D-03    1.887422712154D-03
4   -4.314430346833D-01   -8.545622758573D-04    7.288308305238D-04
5    9.436567726730D-02    3.330555462733D-04   -3.941114594575D-04
6   -1.384992697339D-02    5.154637596963D-06    2.704571960637D-05
7    1.132016190295D-03   -1.288164830284D-05    7.769128981290D-06
8   -3.842014088368D-05    1.171737695451D-06   -9.017007769431D-07
0   -2.360275829176D-07    2.352410977770D-05   -4.997866180134D-06
1    4.986004995584D-04   -1.488915435909D-04    2.064670043755D-05
2    1.292894496252D-03   -2.905449411133D-04    3.788502709678D-05
3   -9.327238099803D-04    2.128634474527D-04   -2.509788157193D-05
4   -2.484715070595D-04    4.842155320136D-05   -6.186008058267D-06
5    1.711527657525D-04   -3.637820737985D-05    4.163286478680D-06
6   -2.084393307530D-05    5.401855723043D-06   -6.247464789742D-07
7   -1.221455182210D-06   -3.231445161484D-09    9.993216378891D-09
8    2.476534052706D-07   -3.367686347533D-08    2.869160964443D-09
0    4.276219304407D-07   -1.656742885479D-08    2.414039859152D-10
1   -1.483657661440D-06    5.231689914639D-08   -7.056262049968D-10
2   -2.892758625724D-06    1.174418148176D-07   -1.927933996765D-09
3    1.553010173585D-06   -4.703323705313D-08    5.371568383284D-10
4    5.102144895277D-07   -2.321199392340D-08    4.255457918971D-10
5   -2.597547413556D-07    8.256194712004D-09   -1.040875802194D-10
6    3.214084295485D-08   -5.485492350310D-10   -2.766340477990D-12
7    1.346287938920D-10   -7.497501425175D-11    2.502198014796D-12
8   -1.931319268617D-10    9.102276313210D-12   -1.872646131609D-13];
data.H4.reaction_225 = remap_d_raw(d_raw);

%--------------------------------------------------------------------------
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%--------------------------------------------------------------------------
% H.4 Reaction 2.2.9 --> e+H2 -> 2e + H2+
d_raw = [...
0   -3.574773783577D+01    3.470247049909D-01   -9.683166540937D-02
1    1.769208985507D+01   -1.311169841222D+00    4.700486215943D-01
2   -8.291764008409D+00    1.591701525694D+00   -5.814996025336D-01
3    2.555712347240D+00   -8.625268584825D-01    2.612076696684D-01
4   -5.370404654062D-01    2.375816996323D-01   -4.165908778170D-02
5    7.443307905391D-02   -3.322214182214D-02   -2.351235556666D-03
6   -6.391785721973D-03    1.862554278190D-03    1.540632467396D-03
7    3.001729098239D-04    3.497202259366D-05   -1.742029226138D-04
8   -5.607182991432D-06   -5.779550092391D-06    6.495742927455D-06
0    1.959576276250D-03    2.479361119190D-03   -1.196632952666D-04
1   -5.521175478827D-02   -2.689651616933D-03    7.308915874002D-04
2    9.160898084105D-02   -4.770789631868D-03    1.994775632224D-05
3   -3.686525285376D-02    1.945480608139D-03   -3.690918356665D-05
4    1.732469114063D-03    3.693513203529D-04   -4.931268184607D-05
5    1.723053881691D-03   -2.096625925098D-04    1.358575558294D-05
6   -3.547150770477D-04    1.392157055273D-05    1.047463944093D-06
7    2.296551698214D-05    2.357520372192D-06   -5.306085513950D-07
8   -3.040011333889D-07   -2.361542565281D-07    3.655056080262D-08
0   -1.862956119592D-05    1.669867158509D-06   -3.673736278200D-08
1   -2.920560755694D-05   -3.148831240316D-07    2.514856386324D-08
2   -7.511552245648D-06    1.089689676313D-06   -2.920863498031D-08
3    4.836340453567D-06   -4.165748666929D-07    9.265898224345D-09
4    2.727501534044D-06   -1.081027384449D-07    2.420509440644D-09
5   -1.041586202167D-06    6.928574330531D-08   -1.746656185835D-09
6    1.513510667993D-08   -9.915499708242D-09    3.298173891188D-10
7    2.223137028418D-08    3.340169309800D-10   -2.560542889504D-11
8   -1.771478792301D-09    1.334615260635D-11    6.831564719957D-13];
data.H4.reaction_229 = remap_d_raw(d_raw);

%--------------------------------------------------------------------------
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%--------------------------------------------------------------------------
% H.4 Reaction 2.2.10 --> e+H2 -> 2e + H + H+
d_raw = [...
0   -3.793749300315D+01   -3.333162972531D-01    1.849601203843D-01
1    1.280249398154D+01    1.028969438485D+00   -3.271855492638D-01
2   -3.778148553140D+00   -1.415561059533D+00    2.928509524911D-01
3    2.499987501522D-01    1.032922656537D+00   -1.580288004759D-01
4    2.480574522949D-01   -4.372934216955D-01    6.448433196301D-02
5   -9.960628182831D-02    1.092652428162D-01   -1.782307798975D-02
6    1.709129400742D-02   -1.574889001363D-02    2.865310743302D-03
7   -1.435304503973D-03    1.203823111704D-03   -2.350465388313D-04
8    4.808639828229D-05   -3.761591649539D-05    7.490531472388D-06
0   -8.803945197107D-02    2.205180180735D-02   -2.852568161901D-03
1    1.305597441611D-01   -3.408439821910D-02    4.591924060066D-03
2   -7.425165688158D-02    2.028424685287D-02   -3.042376564749D-03
3    9.934702707539D-03   -2.450845732158D-03    5.716646876513D-04
4    1.229222932630D-03   -9.281410519553D-04    5.946235618034D-05
5    1.192181214757D-04    2.310636556641D-04   -2.492990725967D-05
6   -1.700396064727D-04   -1.502644504654D-06    3.297869416435D-07
7    2.507288189894D-05   -3.077975735212D-06    3.748299687254D-07
8   -1.077314971617D-06    1.950247963978D-07   -2.569729600929D-08
0    1.942314738448D-04   -6.597388255594D-06    8.798544848606D-08
1   -3.167471002157D-04    1.070920193931D-05   -1.408139742113D-07
2    2.279124955373D-04   -8.197224564797D-06    1.130682076163D-07
3   -5.339115778704D-05    2.135848413694D-06   -3.072223247387D-08
4   -8.758032156912D-08   -7.270955072707D-08    1.100087131523D-09
5    1.217600444191D-06   -3.624263301602D-08    6.139167092128D-10
6    6.572135289627D-10    4.269190108005D-10   -3.666090917669D-11
7   -2.613600078122D-08    8.263175463927D-10   -8.509179497022D-12
8    1.804377780165D-09   -6.031847199601D-11    7.416020205748D-13];
data.H4.reaction_2210 = remap_d_raw(d_raw);

%--------------------------------------------------------------------------
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%--------------------------------------------------------------------------
% H.3 Reaction 3.1.8 --> charge exchange (Ti,Ebeam)
d_raw = [...
0 -1.831670498376D+01 1.650239332070D-01 5.025740610454D-02
1 2.143624996483D-01 -1.067658289373D-01 -5.304993033743D-03
2 5.139117192662D-02 9.536923957409D-03 -1.306075129405D-02
3 -9.896180369559D-04 6.315097684976D-03 2.655464630308D-03
4 -2.495327546080D-03 -1.265503371044D-03 7.569269700468D-04
5 -2.417046684097D-05 -6.945512319613D-05 -2.956984088728D-04
6 1.177406072793D-04 3.698501620365D-05 3.424317896619D-05
7 -1.483036457978D-05 -3.348172574417D-06 -1.527018819072D-06
8 5.351909441226D-07 9.728230870242D-08 1.676354786072D-08
0 5.288358515136D-03 -2.437122342843D-03 -4.461891214720D-04
1 8.289383645942D-03 -9.698773663345D-05 -4.470180279338D-04
2 -1.033166370333D-03 1.280464204775D-03 -8.453294908907D-05
3 -1.365781346175D-03 -1.859939123743D-04 1.237942304972D-04
4 2.756946036257D-04 -1.107375149384D-04 -7.217379426085D-06
5 2.318277483195D-05 3.704494397140D-05 -6.066558692480D-06
6 -9.815693511794D-06 -4.285719813022D-06 1.169257650609D-06
7 8.362050692462D-07 2.058392726953D-07 -7.463594884928D-08
8 -2.237567830699D-08 -3.081685803820D-09 1.450862501121D-09
0 1.731631548110D-04 -1.588434781959D-05 4.482291414386D-07
1 7.944326905066D-05 -5.303688417551D-06 1.235167254501D-07
2 -3.040874906105D-05 4.747888095498D-06 -1.923953750574D-07
3 -1.588253432932D-05 6.603560345800D-07 -1.970606344918D-09
4 5.769971321188D-06 -6.717311113584D-07 2.440961351104D-08
5 -4.951573401626D-07 1.437520597154D-07 -6.998724470004D-09
6 -4.968953461875D-10 -1.618948982477D-08 9.440094842562D-10
7 5.924370389093D-10 1.078208689229D-09 -6.619767848464D-11
8 4.434231893204D-11 -3.324377862622D-11 1.935019679501D-12];
data.H3.reaction_318 = remap_d_raw(d_raw);

%--------------------------------------------------------------------------
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%--------------------------------------------------------------------------
% H.3 Reaction 3.1.2 --> Effective ion conversion p+H2 -> H + H2+
d_raw = [...
0 -2.133104980000E+01 2.961905900000E-01 -2.876892150000E-02
1 2.308461720000E+00 -1.064800460000E+00 2.310120950000E-01
2 -2.026151710000E+00 1.142806740000E+00 -2.621943460000E-01
3 1.648000330000E-01 -4.675786500000E-01 1.242261910000E-01
4 1.651993580000E-01 5.766584690000E-02 -3.659922760000E-02
5 -2.598458070000E-02 1.349144350000E-02 8.871659800000E-03
6 -4.330453510000E-03 -5.246404340000E-03 -1.636107180000E-03
7 1.187405610000E-03 6.281964210000E-04 1.740000360000E-04
8 -6.897815380000E-05 -2.667160440000E-05 -7.528040300000E-06
0 -3.323271590000E-02 7.234558340000E-03 2.940230100000E-04
1 6.809382980000E-02 -4.241210420000E-02 8.271152020000E-03
2 -6.877694430000E-02 4.012716970000E-02 -6.143307540000E-03
3 1.774294860000E-02 -1.157658350000E-02 1.311061300000E-03
4 7.083346120000E-03 3.403537010000E-04 -2.752152790000E-04
5 -5.231162040000E-03 3.324241650000E-04 1.985585660000E-04
6 1.242023150000E-03 -4.524774630000E-05 -6.369415730000E-05
7 -1.337853740000E-04 6.784609160000E-07 8.284840740000E-06
8 5.516687380000E-06 1.140207820000E-07 -3.837975410000E-07
0 -8.005031610000E-05 0.000000000000E+00 0.000000000000E+00
1 -6.275988100000E-04 0.000000000000E+00 0.000000000000E+00
2 3.233852920000E-04 0.000000000000E+00 0.000000000000E+00
3 -1.125957730000E-05 0.000000000000E+00 0.000000000000E+00
4 2.225165850000E-05 0.000000000000E+00 0.000000000000E+00
5 -2.813630850000E-05 0.000000000000E+00 0.000000000000E+00
6 8.679231940000E-06 0.000000000000E+00 0.000000000000E+00
7 -1.075372230000E-06 0.000000000000E+00 0.000000000000E+00
8 4.793672020000E-08 0.000000000000E+00 0.000000000000E+00];
data.H3.reaction_323 = remap_d_raw(d_raw);


%--------------------------------------------------------------------------
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
%--------------------------------------------------------------------------
function d = remap_d_raw(d_raw)
nrow = size(d_raw,1);
ncol = size(d_raw,2);
nt = max(d_raw(:,1))+1;
nrpt = nrow/nt;
ne = (ncol-1)*nrpt;
for i = 1:nrpt
    d(1:nt,(i-1)*ne/nrpt+1:i*ne/nrpt) = d_raw((i-1)*ne+1:i*ne,2:ncol);
end

