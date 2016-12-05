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
