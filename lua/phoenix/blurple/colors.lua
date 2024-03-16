local M = {}

M.colors = {
  ['red.100'] = '#fef8f9',
  ['red.130'] = '#fef4f4',
  ['red.160'] = '#feeaea',
  ['red.200'] = '#fdddde',
  ['red.230'] = '#fbcdce',
  ['red.260'] = '#fbbabb',
  ['red.300'] = '#fba6a8',
  ['red.330'] = '#fa9193',
  ['red.345'] = '#fa777b',
  ['red.360'] = '#f85b5f',
  ['red.400'] = '#f23f43',
  ['red.430'] = '#da373c',
  ['red.460'] = '#bb3033',
  ['red.500'] = '#a12829',
  ['red.530'] = '#8f2022',
  ['red.560'] = '#7f1c1e',
  ['red.600'] = '#70181a',
  ['red.630'] = '#651517',
  ['red.660'] = '#5a1314',
  ['red.700'] = '#501012',
  ['red.730'] = '#460e0f',
  ['red.760'] = '#3f0b0c',
  ['red.800'] = '#360a0b',
  ['red.830'] = '#2e090a',
  ['red.860'] = '#280808',
  ['red.900'] = '#220606',
  ['orange.100'] = '#fff8f5',
  ['orange.130'] = '#fff4ed',
  ['orange.160'] = '#feeadf',
  ['orange.200'] = '#fddecd',
  ['orange.230'] = '#fccfb2',
  ['orange.260'] = '#fcbd95',
  ['orange.300'] = '#fbab70',
  ['orange.330'] = '#fa9746',
  ['orange.345'] = '#f1882a',
  ['orange.360'] = '#db7628',
  ['orange.400'] = '#c46926',
  ['orange.430'] = '#ac591f',
  ['orange.460'] = '#9b4c19',
  ['orange.500'] = '#8c4013',
  ['orange.530'] = '#7b3710',
  ['orange.560'] = '#6d300e',
  ['orange.600'] = '#5f2b0b',
  ['orange.630'] = '#56260a',
  ['orange.660'] = '#4c2209',
  ['orange.700'] = '#431e09',
  ['orange.730'] = '#3b1a07',
  ['orange.760'] = '#331606',
  ['orange.800'] = '#2d1305',
  ['orange.830'] = '#261005',
  ['orange.860'] = '#200e05',
  ['orange.900'] = '#190d04',
  ['yellow.100'] = '#fff8ef',
  ['yellow.130'] = '#fff4e8',
  ['yellow.160'] = '#ffebd3',
  ['yellow.200'] = '#fee0b6',
  ['yellow.230'] = '#fdd18c',
  ['yellow.260'] = '#fcc145',
  ['yellow.300'] = '#f0b232',
  ['yellow.330'] = '#e1a42a',
  ['yellow.345'] = '#d49824',
  ['yellow.360'] = '#bf861c',
  ['yellow.400'] = '#af7615',
  ['yellow.430'] = '#9a650d',
  ['yellow.460'] = '#8a5709',
  ['yellow.500'] = '#7c4b04',
  ['yellow.530'] = '#6d4104',
  ['yellow.560'] = '#613803',
  ['yellow.600'] = '#543203',
  ['yellow.630'] = '#4c2d03',
  ['yellow.660'] = '#432803',
  ['yellow.700'] = '#3b2303',
  ['yellow.730'] = '#351e02',
  ['yellow.760'] = '#2e1a02',
  ['yellow.800'] = '#271602',
  ['yellow.830'] = '#221302',
  ['yellow.860'] = '#1c1002',
  ['yellow.900'] = '#160e02',
  ['green.100'] = '#ecfef1',
  ['green.130'] = '#defee7',
  ['green.160'] = '#bdfcd3',
  ['green.200'] = '#88fbb5',
  ['green.230'] = '#58f39c',
  ['green.260'] = '#48e58b',
  ['green.300'] = '#3bd67f',
  ['green.330'] = '#2dc771',
  ['green.345'] = '#26b968',
  ['green.360'] = '#23a55a',
  ['green.400'] = '#24934e',
  ['green.430'] = '#248045',
  ['green.460'] = '#1f703c',
  ['green.500'] = '#1a6334',
  ['green.530'] = '#15562b',
  ['green.560'] = '#124c24',
  ['green.600'] = '#0e431f',
  ['green.630'] = '#0c3c1c',
  ['green.660'] = '#0a3618',
  ['green.700'] = '#072f15',
  ['green.730'] = '#052910',
  ['green.760'] = '#03240e',
  ['green.800'] = '#031f0c',
  ['green.830'] = '#031b0a',
  ['green.860'] = '#041708',
  ['green.900'] = '#051307',
  ['blue.100'] = '#f6fafe',
  ['blue.130'] = '#f0f7fe',
  ['blue.160'] = '#e2f0fd',
  ['blue.200'] = '#cde8fd',
  ['blue.230'] = '#b2ddfc',
  ['blue.260'] = '#94d2fc',
  ['blue.300'] = '#66c4fd',
  ['blue.330'] = '#2eb6ff',
  ['blue.345'] = '#00aafc',
  ['blue.360'] = '#0097f2',
  ['blue.400'] = '#0082eb',
  ['blue.430'] = '#006be7',
  ['blue.460'] = '#005cd1',
  ['blue.500'] = '#0051b6',
  ['blue.530'] = '#00489b',
  ['blue.560'] = '#004088',
  ['blue.600'] = '#003976',
  ['blue.630'] = '#00336a',
  ['blue.660'] = '#002d5f',
  ['blue.700'] = '#002855',
  ['blue.730'] = '#002348',
  ['blue.760'] = '#001e3f',
  ['blue.800'] = '#001a36',
  ['blue.830'] = '#001630',
  ['blue.860'] = '#00132b',
  ['blue.900'] = '#001024',
  ['teal.100'] = '#f4fbfd',
  ['teal.130'] = '#e9f9fd',
  ['teal.160'] = '#d3f4fb',
  ['teal.200'] = '#b1eff9',
  ['teal.230'] = '#7ee7f7',
  ['teal.260'] = '#5edbef',
  ['teal.300'] = '#47cbe2',
  ['teal.330'] = '#35bcd5',
  ['teal.345'] = '#2eb0c9',
  ['teal.360'] = '#289fb6',
  ['teal.400'] = '#248da1',
  ['teal.430'] = '#207a8d',
  ['teal.460'] = '#1b6b7c',
  ['teal.500'] = '#175e6d',
  ['teal.530'] = '#13525f',
  ['teal.560'] = '#0f4954',
  ['teal.600'] = '#0c4049',
  ['teal.630'] = '#0a3942',
  ['teal.660'] = '#08333a',
  ['teal.700'] = '#062d34',
  ['teal.730'] = '#05272d',
  ['teal.760'] = '#042227',
  ['teal.800'] = '#031d21',
  ['teal.830'] = '#02191d',
  ['teal.860'] = '#021619',
  ['teal.900'] = '#011215',
  ['white.100'] = '#ffffff',
  ['white.130'] = '#ffffff',
  ['white.160'] = '#ffffff',
  ['white.200'] = '#ffffff',
  ['white.230'] = '#ffffff',
  ['white.260'] = '#ffffff',
  ['white.300'] = '#ffffff',
  ['white.330'] = '#ffffff',
  ['white.345'] = '#ffffff',
  ['white.360'] = '#ffffff',
  ['white.400'] = '#ffffff',
  ['white.430'] = '#ffffff',
  ['white.460'] = '#ffffff',
  ['white.500'] = '#ffffff',
  ['white.530'] = '#e8e8e8',
  ['white.560'] = '#cfcfcf',
  ['white.600'] = '#adadad',
  ['white.630'] = '#969696',
  ['white.660'] = '#838383',
  ['white.700'] = '#666666',
  ['white.730'] = '#5f5f5f',
  ['white.760'] = '#585858',
  ['white.800'] = '#4d4d4d',
  ['white.830'] = '#3b3b3b',
  ['white.860'] = '#262626',
  ['white.900'] = '#0d0d0d',
  ['black.100'] = '#f2f2f2',
  ['black.130'] = '#e8e8e8',
  ['black.160'] = '#dadada',
  ['black.200'] = '#cccccc',
  ['black.230'] = '#bdbdbd',
  ['black.260'] = '#acacac',
  ['black.300'] = '#999999',
  ['black.330'] = '#7a7a7a',
  ['black.345'] = '#666666',
  ['black.360'] = '#5c5c5c',
  ['black.400'] = '#333333',
  ['black.430'] = '#252525',
  ['black.460'] = '#141414',
  ['black.500'] = '#000000',
  ['black.530'] = '#000000',
  ['black.560'] = '#000000',
  ['black.600'] = '#000000',
  ['black.630'] = '#000000',
  ['black.660'] = '#000000',
  ['black.700'] = '#000000',
  ['black.730'] = '#000000',
  ['black.760'] = '#000000',
  ['black.800'] = '#000000',
  ['black.830'] = '#000000',
  ['black.860'] = '#000000',
  ['black.900'] = '#000000',
  ['brand.100'] = '#f7f7fe',
  ['brand.130'] = '#f0f1fe',
  ['brand.160'] = '#e7e9fd',
  ['brand.200'] = '#dee0fc',
  ['brand.230'] = '#d4d7fc',
  ['brand.260'] = '#c9cdfb',
  ['brand.300'] = '#bcc1fa',
  ['brand.330'] = '#a8aff8',
  ['brand.345'] = '#9ba3f7',
  ['brand.360'] = '#949cf7',
  ['brand.400'] = '#7984f5',
  ['brand.430'] = '#707bf4',
  ['brand.460'] = '#6571f3',
  ['brand.500'] = '#5865f2',
  ['brand.530'] = '#505cdc',
  ['brand.560'] = '#4752c4',
  ['brand.600'] = '#3c45a5',
  ['brand.630'] = '#343b8f',
  ['brand.660'] = '#2d347d',
  ['brand.700'] = '#232861',
  ['brand.730'] = '#21265b',
  ['brand.760'] = '#1e2353',
  ['brand.800'] = '#1a1e49',
  ['brand.830'] = '#141738',
  ['brand.860'] = '#0d0f24',
  ['brand.900'] = '#04050c',
  ['primary.100'] = '#f9f9f9',
  ['primary.130'] = '#f2f3f5',
  ['primary.160'] = '#ebedef',
  ['primary.200'] = '#e3e5e8',
  ['primary.230'] = '#dbdee1',
  ['primary.260'] = '#d2d5d9',
  ['primary.300'] = '#c4c9ce',
  ['primary.330'] = '#b5bac1',
  ['primary.345'] = '#a5abb3',
  ['primary.360'] = '#949ba4',
  ['primary.400'] = '#80848e',
  ['primary.430'] = '#6d6f78',
  ['primary.460'] = '#5c5e66',
  ['primary.500'] = '#4e5058',
  ['primary.530'] = '#41434a',
  ['primary.560'] = '#383a40',
  ['primary.600'] = '#313338',
  ['primary.630'] = '#2b2d31',
  ['primary.645'] = '#282a2e',
  ['primary.660'] = '#232428',
  ['primary.700'] = '#1e1f22',
  ['primary.730'] = '#1a1b1e',
  ['primary.760'] = '#161719',
  ['primary.800'] = '#111214',
  ['primary.830'] = '#0c0c0d',
  ['primary.860'] = '#060607',
  ['primary.900'] = '#020202',
  ['plum.0'] = '#f9f9fa',
  ['plum.1'] = '#f3f3f4',
  ['plum.2'] = '#ecedef',
  ['plum.3'] = '#e4e5e8',
  ['plum.4'] = '#dddee1',
  ['plum.5'] = '#d3d5d9',
  ['plum.6'] = '#c7c8ce',
  ['plum.7'] = '#b8bac1',
  ['plum.8'] = '#a8aab4',
  ['plum.9'] = '#9597a3',
  ['plum.10'] = '#828391',
  ['plum.11'] = '#6d6f7e',
  ['plum.12'] = '#5c5d6e',
  ['plum.13'] = '#4e4f5f',
  ['plum.14'] = '#414252',
  ['plum.15'] = '#383948',
  ['plum.16'] = '#31323f',
  ['plum.17'] = '#2b2c38',
  ['plum.18'] = '#262732',
  ['plum.19'] = '#21222b',
  ['plum.20'] = '#1c1d26',
  ['plum.21'] = '#181921',
  ['plum.22'] = '#15161d',
  ['plum.23'] = '#121319',
  ['plum.24'] = '#0f1015',
  ['plum.25'] = '#0c0c10',
  ['plum.26'] = '#08080b',
}

M.themes = {}

M.themes.darker = {
  bg_primary = M.colors['plum.20'],
  bg_secondary = M.colors['plum.18'],
}

return M
