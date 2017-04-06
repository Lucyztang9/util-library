function cf = colorflipper(num_colors,cmap)
% cf = colorflipper(num_colors,cmap)
% cf(num_colors,3)
% Available options for cmap:
%'jet'
%'jet_to_white'
%'parula'
%'hsv'
%'cw'  -- cool warm
%'rb'
%'blues'
%'morgan'
%'rainbow'
%'rainbow_to_white'
%Default is jet

if nargin < 1
    num_colors = [];
end
if nargin < 2
    cmap = 'jet';
end

switch lower(cmap)
    case {'jet'}
        cf = jet(num_colors);
        return;
    case {'jet_to_white'}
        cf = cmap_jet_to_white(num_colors);
        return;
    case {'jet_white_last'}
        cf = cmap_jet_to_white(num_colors,1);
        return;        
    case {'rainbow_to_white'}
        cf = cmap_rainbow_to_white(16);
    case {'rainbow_white_last'}
        cf = cmap_rainbow_to_white(1);        
    case {'parula'}
        cf = parula(num_colors);
        return;
    case {'hsv'}
        cf = hsv(num_colors);
        return;
    case {'cw'}
        cf = cmap_cw;
    case {'rb'}
        cf = cmap_rb;
    case {'blues'}
        cf = cmap_blues;
    case {'morgan'}
        cf = cmap_morgan;
    case {'rainbow'}
        cf = cmap_rainbow;
    case {'magma'}
        cf = cmap_magma;
    otherwise
        cf = hsv(num_colors);
        return;
end

if ~isempty(num_colors)
    cf = interpolate_cf(cf,num_colors);
end

end

function cf2 = interpolate_cf(cf,n)
index = linspace(1,size(cf,1),n);
cf2 = zeros(n,3);
cf2(:,1) = interp1(1:size(cf,1),cf(:,1),index);
cf2(:,2) = interp1(1:size(cf,1),cf(:,2),index);
cf2(:,3) = interp1(1:size(cf,1),cf(:,3),index);
end

function cmap = cmap_magma()

cmap = [...
   0.001461590960000   0.000466127766000   0.013865520000000
   0.002257640070000   0.001294954310000   0.018331146100000
   0.003279432220000   0.002304529910000   0.023708329100000
   0.004512302220000   0.003490376660000   0.029964705900000
   0.005949769870000   0.004842850000000   0.037129669500000
   0.007587985500000   0.006356136220000   0.044973077400000
   0.009426043900000   0.008021850060000   0.052844356100000
   0.011465433700000   0.009828314860000   0.060749638000000
   0.013707570600000   0.011770591300000   0.068666584300000
   0.016155756600000   0.013840496600000   0.076602666000000
   0.018815367000000   0.016026275300000   0.084584489700000
   0.021691934000000   0.018320125400000   0.092610105000000
   0.024791781400000   0.020714787500000   0.100675555000000
   0.028122815400000   0.023200928400000   0.108786954000000
   0.031695530400000   0.025765116100000   0.116964722000000
   0.035520446800000   0.028397457000000   0.125209396000000
   0.039608487200000   0.031089565200000   0.133515085000000
   0.043829535000000   0.033829988500000   0.141886249000000
   0.048061639100000   0.036606610100000   0.150326989000000
   0.052320438800000   0.039406602000000   0.158841025000000
   0.056614897800000   0.042159892500000   0.167445592000000
   0.060949393000000   0.044794492400000   0.176128834000000
   0.065330180100000   0.047317779600000   0.184891506000000
   0.069763729600000   0.049726466600000   0.193735088000000
   0.074256515200000   0.052016776600000   0.202660374000000
   0.078815003400000   0.054184480100000   0.211667355000000
   0.083445631300000   0.056224936500000   0.220755099000000
   0.088154773000000   0.058133146500000   0.229921611000000
   0.092948691400000   0.059903816700000   0.239163669000000
   0.097833477000000   0.061531441400000   0.248476662000000
   0.102814972000000   0.063010405300000   0.257854400000000
   0.107898679000000   0.064335110200000   0.267288933000000
   0.113094451000000   0.065492035800000   0.276783978000000
   0.118405035000000   0.066479159300000   0.286320656000000
   0.123832651000000   0.067294644900000   0.295879431000000
   0.129380192000000   0.067934926400000   0.305442931000000
   0.135053322000000   0.068391279800000   0.314999890000000
   0.140857952000000   0.068654071000000   0.324537640000000
   0.146785234000000   0.068738232300000   0.334011109000000
   0.152839217000000   0.068636859900000   0.343404450000000
   0.159017511000000   0.068354022500000   0.352688028000000
   0.165308131000000   0.067910868900000   0.361816426000000
   0.171713033000000   0.067305326000000   0.370770827000000
   0.178211730000000   0.066575807300000   0.379497161000000
   0.184800877000000   0.065732438100000   0.387972507000000
   0.191459745000000   0.064818331200000   0.396151969000000
   0.198176877000000   0.063862416600000   0.404008953000000
   0.204934882000000   0.062906619200000   0.411514273000000
   0.211718061000000   0.061991787600000   0.418646741000000
   0.218511590000000   0.061158491800000   0.425391816000000
   0.225302032000000   0.060445184300000   0.431741767000000
   0.232076515000000   0.059888685500000   0.437694665000000
   0.238825991000000   0.059517038400000   0.443255999000000
   0.245543175000000   0.059352438400000   0.448435938000000
   0.252220252000000   0.059414711900000   0.453247729000000
   0.258857304000000   0.059705599800000   0.457709924000000
   0.265446744000000   0.060236875400000   0.461840297000000
   0.271994089000000   0.060993555200000   0.465660375000000
   0.278493300000000   0.061977813600000   0.469190328000000
   0.284951097000000   0.063167626100000   0.472450879000000
   0.291365817000000   0.064553448600000   0.475462193000000
   0.297740413000000   0.066117043200000   0.478243482000000
   0.304080941000000   0.067835345200000   0.480811572000000
   0.310382027000000   0.069702476700000   0.483186340000000
   0.316654235000000   0.071689527200000   0.485380429000000
   0.322899126000000   0.073781950400000   0.487408399000000
   0.329114038000000   0.075971508100000   0.489286796000000
   0.335307503000000   0.078236104500000   0.491024144000000
   0.341481725000000   0.080563507900000   0.492631321000000
   0.347635742000000   0.082946351200000   0.494120923000000
   0.353773161000000   0.085372632900000   0.495501096000000
   0.359897941000000   0.087831177200000   0.496778331000000
   0.366011928000000   0.090314303100000   0.497959963000000
   0.372116205000000   0.092815991700000   0.499053326000000
   0.378210547000000   0.095332294700000   0.500066568000000
   0.384299445000000   0.097854910600000   0.501001964000000
   0.390384361000000   0.100379466000000   0.501864236000000
   0.396466670000000   0.102902194000000   0.502657590000000
   0.402547663000000   0.105419865000000   0.503385761000000
   0.408628505000000   0.107929771000000   0.504052118000000
   0.414708664000000   0.110431177000000   0.504661843000000
   0.420791157000000   0.112920210000000   0.505214935000000
   0.426876965000000   0.115395258000000   0.505713602000000
   0.432967001000000   0.117854987000000   0.506159754000000
   0.439062114000000   0.120298314000000   0.506555026000000
   0.445163096000000   0.122724371000000   0.506900806000000
   0.451270678000000   0.125132484000000   0.507198258000000
   0.457385535000000   0.127522145000000   0.507448336000000
   0.463508291000000   0.129892998000000   0.507651812000000
   0.469639514000000   0.132244819000000   0.507809282000000
   0.475779723000000   0.134577500000000   0.507921193000000
   0.481928997000000   0.136891390000000   0.507988509000000
   0.488088169000000   0.139186217000000   0.508010737000000
   0.494257673000000   0.141462106000000   0.507987836000000
   0.500437834000000   0.143719323000000   0.507919772000000
   0.506628929000000   0.145958202000000   0.507806420000000
   0.512831195000000   0.148179144000000   0.507647570000000
   0.519044825000000   0.150382611000000   0.507442938000000
   0.525269968000000   0.152569121000000   0.507192172000000
   0.531506735000000   0.154739247000000   0.506894860000000
   0.537755194000000   0.156893613000000   0.506550538000000
   0.544015371000000   0.159032895000000   0.506158696000000
   0.550287252000000   0.161157816000000   0.505718782000000
   0.556570783000000   0.163269149000000   0.505230210000000
   0.562865867000000   0.165367714000000   0.504692365000000
   0.569172368000000   0.167454379000000   0.504104606000000
   0.575490107000000   0.169530062000000   0.503466273000000
   0.581818864000000   0.171595728000000   0.502776690000000
   0.588158375000000   0.173652392000000   0.502035167000000
   0.594508337000000   0.175701122000000   0.501241011000000
   0.600868399000000   0.177743036000000   0.500393522000000
   0.607238169000000   0.179779309000000   0.499491999000000
   0.613617209000000   0.181811170000000   0.498535746000000
   0.620005032000000   0.183839907000000   0.497524075000000
   0.626401108000000   0.185866869000000   0.496456304000000
   0.632804854000000   0.187893468000000   0.495331769000000
   0.639215638000000   0.189921182000000   0.494149821000000
   0.645632778000000   0.191951556000000   0.492909832000000
   0.652055535000000   0.193986210000000   0.491611196000000
   0.658483116000000   0.196026835000000   0.490253338000000
   0.664914668000000   0.198075202000000   0.488835712000000
   0.671349279000000   0.200133166000000   0.487357807000000
   0.677785975000000   0.202202663000000   0.485819154000000
   0.684223712000000   0.204285721000000   0.484219325000000
   0.690661380000000   0.206384461000000   0.482557941000000
   0.697097796000000   0.208501100000000   0.480834678000000
   0.703531700000000   0.210637956000000   0.479049270000000
   0.709961888000000   0.212797337000000   0.477201121000000
   0.716387038000000   0.214981693000000   0.475289780000000
   0.722805451000000   0.217193831000000   0.473315708000000
   0.729215521000000   0.219436516000000   0.471278924000000
   0.735615545000000   0.221712634000000   0.469179541000000
   0.742003713000000   0.224025196000000   0.467017774000000
   0.748378107000000   0.226377345000000   0.464793954000000
   0.754736692000000   0.228772352000000   0.462508534000000
   0.761077312000000   0.231213625000000   0.460162106000000
   0.767397681000000   0.233704708000000   0.457755411000000
   0.773695380000000   0.236249283000000   0.455289354000000
   0.779967847000000   0.238851170000000   0.452765022000000
   0.786212372000000   0.241514325000000   0.450183695000000
   0.792426972000000   0.244242250000000   0.447543155000000
   0.798607760000000   0.247039798000000   0.444848441000000
   0.804751511000000   0.249911350000000   0.442101615000000
   0.810854841000000   0.252861399000000   0.439304963000000
   0.816914186000000   0.255894550000000   0.436461074000000
   0.822925797000000   0.259015505000000   0.433572874000000
   0.828885740000000   0.262229049000000   0.430643647000000
   0.834790818000000   0.265539703000000   0.427671352000000
   0.840635680000000   0.268952874000000   0.424665620000000
   0.846415804000000   0.272473491000000   0.421631064000000
   0.852126490000000   0.276106469000000   0.418572767000000
   0.857762870000000   0.279856666000000   0.415496319000000
   0.863320397000000   0.283729003000000   0.412402889000000
   0.868793368000000   0.287728205000000   0.409303002000000
   0.874176342000000   0.291858679000000   0.406205397000000
   0.879463944000000   0.296124596000000   0.403118034000000
   0.884650824000000   0.300530090000000   0.400047060000000
   0.889731418000000   0.305078817000000   0.397001559000000
   0.894700194000000   0.309773445000000   0.393994634000000
   0.899551884000000   0.314616425000000   0.391036674000000
   0.904281297000000   0.319609981000000   0.388136889000000
   0.908883524000000   0.324755126000000   0.385308008000000
   0.913354091000000   0.330051947000000   0.382563414000000
   0.917688852000000   0.335500068000000   0.379915138000000
   0.921884187000000   0.341098112000000   0.377375977000000
   0.925937102000000   0.346843685000000   0.374959077000000
   0.929845090000000   0.352733817000000   0.372676513000000
   0.933606454000000   0.358764377000000   0.370540883000000
   0.937220874000000   0.364929312000000   0.368566525000000
   0.940687443000000   0.371224168000000   0.366761699000000
   0.944006448000000   0.377642889000000   0.365136328000000
   0.947179528000000   0.384177874000000   0.363701130000000
   0.950210150000000   0.390819546000000   0.362467694000000
   0.953099077000000   0.397562894000000   0.361438431000000
   0.955849237000000   0.404400213000000   0.360619076000000
   0.958464079000000   0.411323666000000   0.360014232000000
   0.960949221000000   0.418323245000000   0.359629789000000
   0.963310281000000   0.425389724000000   0.359469020000000
   0.965549351000000   0.432518707000000   0.359529151000000
   0.967671128000000   0.439702976000000   0.359810172000000
   0.969680441000000   0.446935635000000   0.360311120000000
   0.971582181000000   0.454210170000000   0.361030156000000
   0.973381238000000   0.461520484000000   0.361964652000000
   0.975082439000000   0.468860936000000   0.363111292000000
   0.976690494000000   0.476226350000000   0.364466162000000
   0.978209957000000   0.483612031000000   0.366024854000000
   0.979645181000000   0.491013764000000   0.367782559000000
   0.981000291000000   0.498427800000000   0.369734157000000
   0.982279159000000   0.505850848000000   0.371874301000000
   0.983485387000000   0.513280054000000   0.374197501000000
   0.984622298000000   0.520712972000000   0.376698186000000
   0.985692925000000   0.528147545000000   0.379370774000000
   0.986700017000000   0.535582070000000   0.382209724000000
   0.987646038000000   0.543015173000000   0.385209578000000
   0.988533173000000   0.550445778000000   0.388365009000000
   0.989363341000000   0.557873075000000   0.391670846000000
   0.990138201000000   0.565296495000000   0.395122099000000
   0.990871208000000   0.572706259000000   0.398713971000000
   0.991558165000000   0.580106828000000   0.402441058000000
   0.992195728000000   0.587501706000000   0.406298792000000
   0.992784669000000   0.594891088000000   0.410282976000000
   0.993325561000000   0.602275297000000   0.414389658000000
   0.993834412000000   0.609643540000000   0.418613221000000
   0.994308514000000   0.616998953000000   0.422949672000000
   0.994737698000000   0.624349657000000   0.427396771000000
   0.995121854000000   0.631696376000000   0.431951492000000
   0.995480469000000   0.639026596000000   0.436607159000000
   0.995809924000000   0.646343897000000   0.441360951000000
   0.996095703000000   0.653658756000000   0.446213021000000
   0.996341406000000   0.660969379000000   0.451160201000000
   0.996579803000000   0.668255621000000   0.456191814000000
   0.996774784000000   0.675541484000000   0.461314158000000
   0.996925427000000   0.682827953000000   0.466525689000000
   0.997077185000000   0.690087897000000   0.471811461000000
   0.997186253000000   0.697348991000000   0.477181727000000
   0.997253982000000   0.704610791000000   0.482634651000000
   0.997325180000000   0.711847714000000   0.488154375000000
   0.997350983000000   0.719089119000000   0.493754665000000
   0.997350583000000   0.726324415000000   0.499427972000000
   0.997341259000000   0.733544671000000   0.505166839000000
   0.997284689000000   0.740771893000000   0.510983331000000
   0.997228367000000   0.747980563000000   0.516859378000000
   0.997138480000000   0.755189852000000   0.522805996000000
   0.997019342000000   0.762397883000000   0.528820775000000
   0.996898254000000   0.769590975000000   0.534892341000000
   0.996726862000000   0.776794860000000   0.541038571000000
   0.996570645000000   0.783976508000000   0.547232992000000
   0.996369065000000   0.791167346000000   0.553498939000000
   0.996162309000000   0.798347709000000   0.559819643000000
   0.995932448000000   0.805527126000000   0.566201824000000
   0.995680107000000   0.812705773000000   0.572644795000000
   0.995423973000000   0.819875302000000   0.579140130000000
   0.995131288000000   0.827051773000000   0.585701463000000
   0.994851089000000   0.834212826000000   0.592307093000000
   0.994523666000000   0.841386618000000   0.598982818000000
   0.994221900000000   0.848540474000000   0.605695903000000
   0.993865767000000   0.855711038000000   0.612481798000000
   0.993545285000000   0.862858846000000   0.619299300000000
   0.993169558000000   0.870024467000000   0.626189463000000
   0.992830963000000   0.877168404000000   0.633109148000000
   0.992439881000000   0.884329694000000   0.640099465000000
   0.992089454000000   0.891469549000000   0.647116021000000
   0.991687744000000   0.898627050000000   0.654201544000000
   0.991331929000000   0.905762748000000   0.661308839000000
   0.990929685000000   0.912915010000000   0.668481201000000
   0.990569914000000   0.920048699000000   0.675674592000000
   0.990174637000000   0.927195612000000   0.682925602000000
   0.989814839000000   0.934328540000000   0.690198194000000
   0.989433736000000   0.941470354000000   0.697518628000000
   0.989077438000000   0.948604077000000   0.704862519000000
   0.988717064000000   0.955741520000000   0.712242232000000
   0.988367028000000   0.962878026000000   0.719648627000000
   0.988032885000000   0.970012413000000   0.727076773000000
   0.987690702000000   0.977154231000000   0.734536205000000
   0.987386827000000   0.984287561000000   0.742001547000000
   0.987052509000000   0.991437853000000   0.749504188000000];
end

function cmap = cmap_morgan() %r,g,b
ns=128;
rb_pct = 0.3;
g_pct = 0.6;

rb_pt = floor(rb_pct*ns);
g_pt = floor(g_pct*ns);

rb_side = zeros(1,ns);
rb_side(rb_pt:ns) = linspace(0,255,length(rb_pt:ns));

g_side = 255*ones(1,ns);
g_side(1:g_pt) = linspace(0,255,length(1:g_pt));

cmap = zeros(ns*2,3);
cmap(:,1) = [rb_side,repmat(255,1,ns)];  %R
cmap(:,2) = [g_side,g_side(end:-1:1)];  %G
cmap(:,3) = [repmat(255,1,ns),rb_side(end:-1:1)];  %B

cmap = cmap./256;

end

function cmap = cmap_rainbow()
n = 256;
r = [   0   4   9  13  18  22  27  31  36  40  45  50  54  58  61  64  68  69  72  74  77  79  80  82  83  85  84  86  87  88  86  87  87  87  85  84  84  84 ...
    83  79  78  77  76  71  70  68  66  60  58  55  53  46  43  40  36  33  25  21  16  12   4   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 ...
    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 ...
    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 ...
    0   0   0   0   0   0   0   4   8  12  21  25  29  33  42  46  51  55  63  67  72  76  80  89  93  97 101 110 114 119 123 131 135 140 144 153 157 161 ...
    165 169 178 182 187 191 199 203 208 212 221 225 229 233 242 246 250 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 ...
    255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255];

g = [   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 ...
    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   4   8  16  21  25  29  38  42  46  51  55  63  67  72 ...
    76  84  89  93  97 106 110 114 119 127 131 135 140 144 152 157 161 165 174 178 182 187 195 199 203 208 216 220 225 229 233 242 246 250 255 255 255 255 ...
    255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 ...
    255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 ...
    255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 250 242 238 233 229 221 216 212 208 199 195 191 187 178 174 170 165 161 153 148 ...
    144 140 131 127 123 119 110 106 102  97  89  85  80  76  72  63  59  55  51  42  38  34  29  21  17  12   8   0];

b = [   0   3   7  10  14  19  23  28  32  38  43  48  53  59  63  68  72  77  81  86  91  95 100 104 109 113 118 122 127 132 136 141 145 150 154 159 163 168 ...
    173 177 182 186 191 195 200 204 209 214 218 223 227 232 236 241 245 250 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 ...
    255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 246 242 238 ...
    233 225 220 216 212 203 199 195 191 187 178 174 170 165 157 152 148 144 135 131 127 123 114 110 106 102  97  89  84  80  76  67  63  59  55  46  42  38 ...
    34  25  21  16  12   8   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 ...
    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0 ...
    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0];

cmap = [r;g;b].'/n;

end
function cmap = cmap_blues()
cmap = [255,255,255;
    253,255,255;
    251,255,255;
    249,255,255;
    247,255,255;
    245,255,255;
    243,255,255;
    241,255,255;
    239,255,255;
    236,255,255;
    234,255,255;
    232,255,255;
    230,255,255;
    228,255,255;
    226,255,255;
    224,255,255;
    222,255,255;
    220,255,255;
    218,255,255;
    216,255,255;
    214,255,255;
    212,255,255;
    210,255,255;
    208,255,255;
    206,255,255;
    203,255,255;
    201,255,255;
    199,255,255;
    197,255,255;
    195,255,255;
    193,255,255;
    191,255,255;
    189,255,255;
    187,255,255;
    185,255,255;
    183,255,255;
    181,255,255;
    179,255,255;
    177,255,255;
    175,255,255;
    173,255,255;
    171,255,255;
    168,255,255;
    166,255,255;
    164,255,255;
    162,255,255;
    160,255,255;
    158,255,255;
    156,255,255;
    154,255,255;
    152,255,255;
    150,255,255;
    148,255,255;
    146,255,255;
    144,255,255;
    142,255,255;
    140,255,255;
    138,255,255;
    135,255,255;
    133,255,255;
    131,255,255;
    129,255,255;
    127,255,255;
    125,255,255;
    123,254,255;
    121,252,255;
    119,250,255;
    117,248,255;
    115,246,255;
    113,244,255;
    112,242,255;
    110,240,255;
    108,238,255;
    106,236,255;
    104,234,255;
    102,232,255;
    100,230,255;
    98,228,255;
    96,226,255;
    94,224,255;
    92,222,255;
    90,219,255;
    88,217,255;
    86,215,255;
    84,213,255;
    82,211,255;
    80,209,255;
    79,207,255;
    77,205,255;
    75,203,255;
    73,201,255;
    71,199,255;
    69,197,255;
    67,195,255;
    65,193,255;
    63,191,255;
    61,189,255;
    59,186,255;
    57,184,255;
    55,182,255;
    53,180,255;
    51,178,255;
    49,176,255;
    48,174,255;
    46,172,255;
    44,170,255;
    42,168,255;
    40,166,255;
    38,164,255;
    36,162,255;
    34,160,255;
    32,158,255;
    30,156,255;
    28,154,255;
    26,151,255;
    24,149,255;
    22,147,255;
    20,145,255;
    18,143,255;
    16,141,255;
    15,139,255;
    13,137,255;
    11,135,255;
    9,133,255;
    7,131,255;
    5,129,255;
    3,127,255;
    1,125,255;
    0,123,254;
    0,121,252;
    0,119,250;
    0,117,248;
    0,115,246;
    0,113,244;
    0,111,242;
    0,109,240;
    0,107,237;
    0,105,235;
    0,103,233;
    0,101,231;
    0,99,229;
    0,97,227;
    0,96,225;
    0,94,223;
    0,92,221;
    0,90,219;
    0,88,217;
    0,86,215;
    0,84,213;
    0,82,211;
    0,80,209;
    0,78,207;
    0,76,205;
    0,74,202;
    0,72,200;
    0,70,198;
    0,68,196;
    0,66,194;
    0,64,192;
    0,63,190;
    0,61,188;
    0,59,186;
    0,57,184;
    0,55,182;
    0,53,180;
    0,51,178;
    0,49,176;
    0,47,174;
    0,45,172;
    0,43,169;
    0,41,167;
    0,39,165;
    0,37,163;
    0,35,161;
    0,33,159;
    0,32,157;
    0,30,155;
    0,28,153;
    0,26,151;
    0,24,149;
    0,22,147;
    0,20,145;
    0,18,143;
    0,16,141;
    0,14,139;
    0,12,137;
    0,10,134;
    0,8,132;
    0,6,130;
    0,4,128;
    0,2,126;
    0,0,124;
    0,0,122;
    0,0,120;
    0,0,118;
    0,0,116;
    0,0,114;
    0,0,112;
    0,0,111;
    0,0,109;
    0,0,107;
    0,0,105;
    0,0,103;
    0,0,101;
    0,0,99;
    0,0,97;
    0,0,95;
    0,0,93;
    0,0,91;
    0,0,89;
    0,0,87;
    0,0,85;
    0,0,83;
    0,0,81;
    0,0,80;
    0,0,78;
    0,0,76;
    0,0,74;
    0,0,72;
    0,0,70;
    0,0,68;
    0,0,66;
    0,0,64;
    0,0,62;
    0,0,60;
    0,0,58;
    0,0,56;
    0,0,54;
    0,0,52;
    0,0,50;
    0,0,48;
    0,0,47;
    0,0,45;
    0,0,43;
    0,0,41;
    0,0,39;
    0,0,37;
    0,0,35;
    0,0,33;
    0,0,31;
    0,0,29;
    0,0,27;
    0,0,25;
    0,0,23;
    0,0,21;
    0,0,19;
    0,0,17;
    0,0,16;
    0,0,14;
    0,0,12;
    0,0,10;
    0,0,8;
    0,0,6;
    0,0,4;
    0,0,2;
    0,0,0]./256;
end

function cmap = cmap_cw()
cmap = [    59    76   192
    60    78   194
    61    80   195
    62    81   197
    63    83   198
    64    85   200
    66    87   201
    67    88   203
    68    90   204
    69    92   206
    70    93   207
    71    95   209
    73    97   210
    74    99   211
    75   100   213
    76   102   214
    77   104   215
    79   105   217
    80   107   218
    81   109   219
    82   110   221
    84   112   222
    85   114   223
    86   115   224
    87   117   225
    89   119   226
    90   120   228
    91   122   229
    93   123   230
    94   125   231
    95   127   232
    96   128   233
    98   130   234
    99   131   235
    100   133   236
    102   135   237
    103   136   238
    104   138   239
    106   139   239
    107   141   240
    108   142   241
    110   144   242
    111   145   243
    112   147   243
    114   148   244
    115   150   245
    116   151   246
    118   153   246
    119   154   247
    120   156   247
    122   157   248
    123   158   249
    124   160   249
    126   161   250
    127   163   250
    129   164   251
    130   165   251
    131   167   252
    133   168   252
    134   169   252
    135   171   253
    137   172   253
    138   173   253
    140   174   254
    141   176   254
    142   177   254
    144   178   254
    145   179   254
    147   181   255
    148   182   255
    149   183   255
    151   184   255
    152   185   255
    153   186   255
    155   187   255
    156   188   255
    158   190   255
    159   191   255
    160   192   255
    162   193   255
    163   194   255
    164   195   254
    166   196   254
    167   197   254
    168   198   254
    170   199   253
    171   199   253
    172   200   253
    174   201   253
    175   202   252
    176   203   252
    178   204   251
    179   205   251
    180   205   251
    182   206   250
    183   207   250
    184   208   249
    185   208   248
    187   209   248
    188   210   247
    189   210   247
    190   211   246
    192   212   245
    193   212   245
    194   213   244
    195   213   243
    197   214   243
    198   214   242
    199   215   241
    200   215   240
    201   216   239
    203   216   238
    204   217   238
    205   217   237
    206   217   236
    207   218   235
    208   218   234
    209   219   233
    210   219   232
    211   219   231
    213   219   230
    214   220   229
    215   220   228
    216   220   227
    217   220   225
    218   220   224
    219   220   223
    220   221   222
    221   221   221
    222   220   219
    223   220   218
    224   219   216
    225   219   215
    226   218   214
    227   218   212
    228   217   211
    229   216   209
    230   216   208
    231   215   206
    232   215   205
    232   214   203
    233   213   202
    234   212   200
    235   212   199
    236   211   197
    236   210   196
    237   209   194
    238   209   193
    238   208   191
    239   207   190
    240   206   188
    240   205   187
    241   204   185
    241   203   184
    242   202   182
    242   201   181
    243   200   179
    243   199   178
    244   198   176
    244   197   174
    245   196   173
    245   195   171
    245   194   170
    245   193   168
    246   192   167
    246   191   165
    246   190   163
    246   188   162
    247   187   160
    247   186   159
    247   185   157
    247   184   156
    247   182   154
    247   181   152
    247   180   151
    247   178   149
    247   177   148
    247   176   146
    247   174   145
    247   173   143
    247   172   141
    247   170   140
    247   169   138
    247   167   137
    247   166   135
    246   164   134
    246   163   132
    246   161   131
    246   160   129
    245   158   127
    245   157   126
    245   155   124
    244   154   123
    244   152   121
    244   151   120
    243   149   118
    243   147   117
    242   146   115
    242   144   114
    241   142   112
    241   141   111
    240   139   109
    240   137   108
    239   136   106
    238   134   105
    238   132   103
    237   130   102
    236   129   100
    236   127    99
    235   125    97
    234   123    96
    233   121    95
    233   120    93
    232   118    92
    231   116    90
    230   114    89
    229   112    88
    228   110    86
    227   108    85
    227   106    83
    226   104    82
    225   102    81
    224   100    79
    223    98    78
    222    96    77
    221    94    75
    220    92    74
    218    90    73
    217    88    71
    216    86    70
    215    84    69
    214    82    67
    213    80    66
    212    78    65
    210    75    64
    209    73    62
    208    71    61
    207    69    60
    205    66    59
    204    64    57
    203    62    56
    202    59    55
    200    57    54
    199    54    53
    198    51    52
    196    49    50
    195    46    49
    193    43    48
    192    40    47
    190    37    46
    189    34    45
    188    30    44
    186    26    43
    185    22    41
    183    17    40
    181    11    39
    180     4    38]./256;
end

function cmap = cmap_rb()
cmap = [95 0 0
    97 0 0
    98 0 0
    100 0 0
    101 0 0
    103 0 0
    104 0 0
    106 0 0
    107 0 0
    109 0 0
    110 0 0
    112 0 0
    114 0 0
    115 0 0
    117 0 0
    118 0 0
    120 0 0
    121 0 0
    123 0 0
    124 0 0
    126 0 0
    127 0 0
    129 0 0
    130 0 0
    132 0 0
    134 0 0
    135 0 0
    137 0 0
    138 0 0
    140 0 0
    141 0 0
    143 0 0
    144 0 0
    146 0 0
    147 0 0
    149 0 0
    150 0 0
    152 0 0
    154 0 0
    155 0 0
    157 0 0
    158 0 0
    160 0 0
    161 0 0
    163 0 0
    164 0 0
    166 0 0
    167 0 0
    169 0 0
    170 0 0
    172 0 0
    174 0 0
    175 0 0
    177 0 0
    178 0 0
    180 0 0
    181 0 0
    183 0 0
    184 0 0
    186 0 0
    187 0 0
    189 0 0
    190 0 0
    192 0 0
    193 1 1
    194 5 5
    195 9 9
    196 13 13
    197 17 17
    198 21 21
    199 25 25
    200 29 29
    201 33 33
    202 37 37
    203 41 41
    204 45 45
    205 49 49
    206 53 53
    207 57 57
    208 61 61
    209 65 65
    210 69 69
    211 73 73
    212 77 77
    213 81 81
    214 85 85
    215 89 89
    216 93 93
    217 97 97
    218 101 101
    219 105 105
    220 109 109
    221 113 113
    222 117 117
    223 121 121
    223 125 125
    224 129 129
    225 133 133
    226 137 137
    227 141 141
    228 145 145
    229 149 149
    230 153 153
    231 157 157
    232 161 161
    233 165 165
    234 169 169
    235 173 173
    236 177 177
    237 181 181
    238 185 185
    239 189 189
    240 193 193
    241 197 197
    242 201 201
    243 205 205
    244 209 209
    245 213 213
    246 217 217
    247 221 221
    248 225 225
    249 229 229
    250 233 233
    251 237 237
    252 241 241
    253 245 245
    254 249 249
    255 253 253
    253 253 255
    249 249 254
    245 245 253
    241 241 252
    237 237 251
    233 233 250
    229 229 249
    225 225 248
    221 221 247
    217 217 246
    213 213 245
    209 209 244
    205 205 243
    201 201 242
    197 197 241
    193 193 240
    189 189 239
    185 185 238
    181 181 238
    177 177 237
    173 173 236
    169 169 235
    165 165 234
    161 161 233
    157 157 232
    153 153 231
    149 149 230
    145 145 229
    141 141 228
    137 137 227
    133 133 226
    129 129 225
    125 125 224
    121 121 223
    117 117 222
    113 113 221
    109 109 220
    105 105 220
    101 101 219
    97 97 218
    93 93 217
    89 89 216
    85 85 215
    81 81 214
    77 77 213
    73 73 212
    69 69 211
    65 65 210
    61 61 209
    57 57 208
    53 53 207
    49 49 206
    45 45 205
    41 41 204
    37 37 203
    33 33 203
    29 29 202
    25 25 201
    21 21 200
    17 17 199
    13 13 198
    9 9 197
    5 5 196
    1 1 195
    0 0 194
    0 0 192
    0 0 190
    0 0 189
    0 0 187
    0 0 186
    0 0 184
    0 0 183
    0 0 181
    0 0 179
    0 0 178
    0 0 176
    0 0 175
    0 0 173
    0 0 172
    0 0 170
    0 0 169
    0 0 167
    0 0 165
    0 0 164
    0 0 162
    0 0 161
    0 0 159
    0 0 158
    0 0 156
    0 0 154
    0 0 153
    0 0 151
    0 0 150
    0 0 148
    0 0 147
    0 0 145
    0 0 144
    0 0 142
    0 0 140
    0 0 139
    0 0 137
    0 0 136
    0 0 134
    0 0 133
    0 0 131
    0 0 129
    0 0 128
    0 0 126
    0 0 125
    0 0 123
    0 0 122
    0 0 120
    0 0 119
    0 0 117
    0 0 115
    0 0 114
    0 0 112
    0 0 111
    0 0 109
    0 0 108
    0 0 106
    0 0 104
    0 0 103
    0 0 101
    0 0 100
    0 0 98
    0 0 97
    0 0 95]./256;
end


function cmap = cmap_jet_to_white(num_colors,only_last)
if nargin < 2
    only_last = 0;
end
        
cmap = jet(num_colors);
if only_last
    cmap(1,1:3) = [1 1 1];
else
    iblue = find(ismember(cmap, [0 0 1], 'rows'));
    cmap(1:iblue,1) = linspace(1,0,iblue);
    cmap(1:iblue,2) = linspace(1,0,iblue);
    cmap(1:iblue,3) = 1;
end
end

function cmap = cmap_rainbow_to_white(nscale)
cmap = cmap_rainbow;

if nscale == 1
    cmap(1,1:3) = [1 1 1];
else
    cmap2 = cmap;
    cmap = zeros(size(cmap2,1)+nscale,3);
    cmap(nscale+1:end,1:3) = cmap2;
    c1 = linspace(1,0,nscale);
    cmap(1:nscale,1:3) = [c1;c1;c1].';
end
end
