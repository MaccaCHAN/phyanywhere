import 'package:dse_physics_app/Components/formula_quiz_question_set.dart';
import 'package:dse_physics_app/Components/reusable_equation.dart';

List<FormulaQuizQuestionSet> heat =[
  FormulaQuizQuestionSet(
      id: 'H1',
      description: 'Degree Celsius and degree Kelvin',
      correctEquation: '0^\\circ \\text{C} = 273\\text{K}',
      moreInfoCorrectEq: ['^\\circ \\text{C}:\\text{ degree Celsius}',
        '\\text{K: degree Kelvin} ',],
      equationQ: ReusableEquation(textLT1: '0^\\circ \\text{C} ',  boxRT: true, textRT2: '\\text{K}', ),
      moreInfoQ: [
        '^\\circ \\text{C}:\\text{ degree Celsius}',
        '\\text{K: degree Kelvin} ',
      ],
      option1: '373',
      option2: '-373',
      option3: '273',
      option4: '-273',
      correctAnswer1: '273',
       // correctAnswer2: ''
  ),// H1
  FormulaQuizQuestionSet(
      id: 'H2',
      description: 'Energy transfer during heating and cooling without changing of state',
      correctEquation: 'E=C\\Delta T',
      moreInfoCorrectEq: ['E \\text{: energy transfer}',
        'C \\text{: heat capacity}', '\\Delta T \\text{: change of temperature}'],
      equationQ: ReusableEquation(textLT1: 'E' , boxRT: true, textRT2: '\\Delta T',),
      moreInfoQ: [
        'E \\text{: energy transfer}',
        '\\Delta T \\text{: change of temperature}'
      ],
      option1: 'c', option1Meaning: 'specific heat capacity',
      option2: 'V', option2Meaning: 'volume',
      option3: 'm', option3Meaning: 'mass',
      option4: 'C', option4Meaning: 'heat capacity',
      correctAnswer1: 'C'
  ), //H2
  FormulaQuizQuestionSet(
      id: 'H3',
      description: 'Energy transfer during heating and cooling without changing of state',
      correctEquation: 'E=mc\\Delta T',
      moreInfoCorrectEq: ['E \\text{: energy transfer}','m \\text{: mass}',
        'c \\text{: specific heat capacity}','\\Delta T \\text{: change of temperature}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'm' , boxRT: true, textRT2: '\\Delta T',),
      moreInfoQ: [
        'm \\text{: mass}',
        '\\Delta T \\text{: change of temperature}'
      ],
      option1: 'C', option1Meaning: 'heat capacity',
      option2: 'E', option2Meaning: 'energy transfer',
      option3: 'P', option3Meaning: 'power',
      option4: 'c', option4Meaning: 'specific heat capacity',
      correctAnswer1: 'c',
      correctAnswer2: 'E'
  ),// H3
  FormulaQuizQuestionSet(
      id: 'H4',
      description: 'Energy transfer during change of state',
      correctEquation: 'E=\\Delta ml',
      moreInfoCorrectEq: ['E \\text{: energy transfer}','\\Delta m \\text{: change of mass}',
        'l \\text{: latent heat of fusion/vaporization}'],
      equationQ: ReusableEquation(boxLT:true, boxRT: true, textRT2: 'l' , ),
      moreInfoQ: ['l \\text{: latent heat of fusion/vaporization}'],
      option1: 'E', option1Meaning: 'energy transferred',
      option2: '\\Delta m', option2Meaning: 'change of mass',
      option3: 'm', option3Meaning: 'mass',
      option4: 'T', option4Meaning: 'temperature',
      correctAnswer1: '\\Delta m',
    correctAnswer2: 'E'
  ),// H4
];

List<FormulaQuizQuestionSet> gases =[
  FormulaQuizQuestionSet(
      id: 'G1',

      description: 'General gas law / Ideal gas law',
      correctEquation: 'PV = nRT',
            moreInfoCorrectEq: ['P \\text{: pressure}','V \\text{: volume}',
              'n \\text{: no. of moles}' , 'R \\text{: universal gas constant}', 'T \\text{: temperature}'],
      equationQ: ReusableEquation(boxLT: true, textLT2: 'V', boxRT: true, textRT2: 'RT', ),
      moreInfoQ: ['V \\text{: volume}', 'R \\text{: universal gas constant}', 'T \\text{: temperature}'],
      option1: 'n', option1Meaning: 'no. of moles',
      option2: 'N', option2Meaning: 'no. of molecules',
      option3: 'P', option3Meaning: 'pressure',
      option4: 'm', option4Meaning: 'mass',
      correctAnswer1: 'n',
      correctAnswer2: 'P'
      ),//G1
  FormulaQuizQuestionSet(
      id: 'G2',
      description: 'Kinetic theory equation',
      correctEquation: 'PV = \\frac 13Nm{v_{rms}}^2',
      moreInfoCorrectEq: ['P \\text{: pressure}','V \\text{: volume}',
      'N \\text{: no. of molecules}' , 'm \\text{: molecular mass}',
        '{v_{rms}} \\text{: root-mean-square velocity}'],
      equationQ: ReusableEquation(textLT1: 'P', boxLT: true, textRT1: '\\frac 13Nm', boxRT: true, textRT2: '^2',),
      moreInfoQ: ['P \\text{: pressure}',
        'N \\text{: no. of molecules}' , 'm \\text{: molecular mass}'],
      option1: '{v_{rms}}', option1Meaning: 'root-mean-square velocity',
      option2: '{v_{max}}', option2Meaning: 'maximum velocity',
      option3: 'T', option3Meaning: 'temperature',
      option4: 'V', option4Meaning: 'volume of the gas',
      correctAnswer1: '{v_{rms}}',
      correctAnswer2: 'V'
      ),//G2
  FormulaQuizQuestionSet(
    id: 'G3',

    description: 'Molecular kinetic energy of gas',
      correctEquation: 'KE_{avg} = \\frac{3RT}{2N_a}',
      moreInfoCorrectEq: ['KE_{avg} \\text{: average kinetic energy}','R \\text{: universal gas constant}',
      'T \\text{: temperature}' , "N_a \\text{: Avogadro's constant}",
      '{v_{rms}} \\text{: root-mean-square velocity}'],
      equationQ: ReusableEquation(textLT2: ' KE_{avg}', textRT1: '3', boxRT: true, textRT2: 'T', lineRight: true, textRB1: '2N_a', ),
      moreInfoQ: ['KE_{avg} \\text{: average kinetic energy}',
        'T \\text{: temperature}' , "N_a \\text{: Avogadro's constant}",],
      option1: 'R', option1Meaning: 'universal gas constant',
      option2: 'M', option2Meaning: 'total mass of the gas',
      option3: 'm', option3Meaning: 'mass of a gas molecule',
      option4: 'P', option4Meaning: 'pressure of the gas',
      correctAnswer1: 'R',
      // correctAnswer2: 'V'
  ),//G3
  FormulaQuizQuestionSet(
      id: 'G4',

      description: 'Total kinetic energy of gas',
      correctEquation: 'KE_{total} = \\frac32nRT',
      moreInfoCorrectEq: ['KE_{total} \\text{: total kinetic energy}',"n \\text{: no. of moles}",'R \\text{: universal gas constant}',
        'T \\text{: temperature}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: '\\frac 32', boxRT: true, textRT2: 'RT', ),
      moreInfoQ: ['R \\text{: universal gas constant}', 'T \\text{: temperature}'],
      option1: 'n', option1Meaning: 'no. of moles',
      option2: 'M', option2Meaning: 'total mass of the gas',
      option3: 'm', option3Meaning: 'mass of a gas molecule',
      option4: 'KE_{total}', option4Meaning: 'total kinetic energy',
      correctAnswer1: 'n',
      correctAnswer2: 'KE_{total}'
  ),//G4
  FormulaQuizQuestionSet(
      id: 'G5',

      description: 'Internal energy of gas',
      correctEquation: '\\text {Internal Energy} = \\frac32nRT',
      moreInfoCorrectEq: ["n \\text{: no. of moles}",'R \\text{: universal gas constant}',
        'T \\text{: temperature}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, textRT2: 'nRT', ),
      moreInfoQ: ["n \\text{: no. of moles}", 'R \\text{: universal gas constant}',
        'T \\text{: temperature}'],
      option1: 'n', option1Meaning: 'no. of moles',
      option2: 'U', option2Meaning: 'internal energy of gas',
      option3: '\\frac32',
      option4: '\\frac23',
      correctAnswer1: '\\frac32',
      correctAnswer2: 'U'
  ),//G5
];

List<FormulaQuizQuestionSet> motionAndForce =[
  FormulaQuizQuestionSet(
    id: 'M1',

    description: 'Average speed',
      correctEquation: '\\scriptsize\\text {Avg Speed} = '
          '\\frac{\\scriptsize\\text {Total Distance}}{\\scriptsize\\text {Total Time}}',
      moreInfoCorrectEq: [],
      equationQ: ReusableEquation(textLT1: '\\scriptsize \\text {Avg Speed}',
        boxRT: true, lineRight: true, textRB1: '\\scriptsize\\text {Total Time}', ),
      moreInfoQ: [],
      option1: '\\scriptsize \\text {Avg Distance}',
      option2: '\\scriptsize \\text {Avg Displacement}',
      option3: '\\scriptsize \\text {Total Distance}',
      option4: '\\scriptsize \\text {Total Displacement}',
      correctAnswer1: '\\scriptsize \\text {Total Distance}',
      // correctAnswer2: 'IE'
  ), //M1
  FormulaQuizQuestionSet(
    id: 'M2',

    description: 'Average velocity',
      correctEquation: '\\scriptsize\\text {Avg Velocity} = '
          '\\frac{\\scriptsize\\text {Total Displacement}}{\\scriptsize\\text {Total Time}}',
      moreInfoCorrectEq: [],
      equationQ: ReusableEquation(textLT1: '\\scriptsize \\text {Avg Velocity}',
                  boxRT: true, lineRight: true, textRB1: '\\scriptsize\\text {Total Time}'),
      moreInfoQ: [],
      option1: '\\scriptsize \\text {Avg Distance}',
      option2: '\\scriptsize \\text {Avg Displacement}',
      option3: '\\scriptsize \\text {Total Distance}',
      option4: '\\scriptsize \\text {Total Displacement}',
      correctAnswer1: '\\scriptsize \\text {Total Displacement}',
  ), //M2
  FormulaQuizQuestionSet(
      id: 'M3',

      description: 'Acceleration',
      correctEquation: 'a=\\frac{v-u}t',
      moreInfoCorrectEq: ['a \\text{: acceleration}', 'v \\text{: final velocity}', 'u \\text{: initial velocity}', 't \\text{: time}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, textRT2: '-u', lineRight: true, textRB1: 't', ),
      moreInfoQ: [ 'u \\text{: initial velocity}', 't \\text{: time}'],
      option1: 's', option1Meaning: 'displacement',
      option2: 'v', option2Meaning: 'final velocity',
      option3: 'F', option3Meaning: 'net force',
      option4: 'a', option4Meaning: 'acceleration',
      correctAnswer1: 'v',
      correctAnswer2: 'a'
  ), //M3
  FormulaQuizQuestionSet(
      id: 'M4',

      description: '4 equations of uniformly accelerated motion',
      correctEquation: 's = \\frac12(u+v)t',
      moreInfoCorrectEq: ['s \\text{: displacement}', 'u \\text{: initial velocity}', 'v \\text{: final velocity}', 't \\text{: time}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: '\\frac12(', boxRT: true, textRT2: '+v)t', ),
      moreInfoQ: ['v \\text{: final velocity}', 't \\text{: time}'],
      option1: 'a', option1Meaning: 'acceleration',
      option2: 'u', option2Meaning: 'initial velocity',
      option3: 's', option3Meaning: 'displacement',
      option4: 'F', option4Meaning: 'net force',
      correctAnswer1: 'u',
      correctAnswer2: 's'
  ), //M4
  FormulaQuizQuestionSet(
      id: 'M5',

      description: '4 equations of uniformly accelerated motion',
      correctEquation: 'v^2 - u^2 = 2as',
      moreInfoCorrectEq: ['v \\text{: final velocity}',  'u \\text{: initial velocity}','a \\text{: acceleration}', 's \\text{: displacement}',],
      equationQ: ReusableEquation(boxLT: true , textLT2: '- u^2', textRT1: '2',boxRT: true, textRT2: 's', ),
      moreInfoQ: ['u \\text{: initial velocity}', 's \\text{: displacement}',],
      option1: 'a^2', option1Meaning: 'square of acceleration',
      option2: 'a', option2Meaning: 'acceleration',
      option3: 'v', option3Meaning: 'final velocity',
      option4: 'v^2', option4Meaning: 'square of final velocity',
      correctAnswer1: 'a',
      correctAnswer2: 'v^2'
  ), //M5
  FormulaQuizQuestionSet(
      id: 'M6',

      description: '4 equations of uniformly accelerated motion',
      correctEquation: 's=ut+\\frac12at^2',
      moreInfoCorrectEq: ['s \\text{: displacement}', 'u \\text{: initial velocity}', 't \\text{: time}', 'v \\text{: final velocity}', 'a \\text{: acceleration}', ],
      equationQ: ReusableEquation(boxLT: true ,  textRT1: 'u',boxRT: true, textRT2: '+\\frac12at^2', ),
      moreInfoQ: ['u \\text{: initial velocity}', 'a \\text{: acceleration}','t \\text{: time}' ],
      option1: 'd', option1Meaning: 'distance',
      option2: 's', option2Meaning: 'displacement',
      option3: 't', option3Meaning: 'time',
      option4: 'v^2', option4Meaning: 'square of final velocity',
      correctAnswer1: 't',
      correctAnswer2: 's'
  ), //M6
  FormulaQuizQuestionSet(
      id: 'M7',

      description: '4 equations of uniformly accelerated motion',
      correctEquation: 'v = u + at',
      moreInfoCorrectEq: [ 'v \\text{: final velocity}', 'u \\text{: initial velocity}','a \\text{: acceleration}','t \\text{: time}' ],
      equationQ: ReusableEquation(boxLT: true , textRT1: 'u+',boxRT: true, textRT2: 't', ),
      moreInfoQ: [ 'u \\text{: initial velocity}','t \\text{: time}' ],
      option1: 's', option1Meaning: 'displacement',
      option2: 'a', option2Meaning: 'acceleration',
      option3: 'v', option3Meaning: 'final velocity',
      option4: 'v^2', option4Meaning: 'square of final velocity',
      correctAnswer1: 'a',
      correctAnswer2: 'v'
  ), //M7
  FormulaQuizQuestionSet(
      id: 'M8',

      description: 'Newton’s second law of motion',
      correctEquation: 'F_{net}=ma',
      moreInfoCorrectEq: [ 'F_{net} \\text{: net force}', 'm \\text{: mass}','a \\text{: acceleration}'],
      equationQ: ReusableEquation(boxLT: true , textRT1: 'm',boxRT: true ),
      moreInfoQ: [  'm \\text{: mass}'],
      option1: 'a^2', option1Meaning: 'square of acceleration',
      option2: 'a', option2Meaning: 'acceleration',
      option3: 'F_{net}', option3Meaning: 'net force',
      option4: 'F', option4Meaning: 'applied force',
      correctAnswer1: 'a',
      correctAnswer2: 'F_{net}'
  ), //M8
  FormulaQuizQuestionSet(
    id: 'M9',

    description: 'Moment (torque) of a force',
      correctEquation: '\\text{moment}=F_\\perp\\times d',
      moreInfoCorrectEq: [ 'F_\\perp \\text{: perpendicular force}', 'd \\text{: distance from pivot}'],

      equationQ: ReusableEquation(textLT1:'\\scriptsize\\text{moment}' , boxRT: true, textRT2: '\\times d'),
      moreInfoQ: [ 'd \\text{: distance from pivot}'],

      option1: 'F_{min}', option1Meaning: 'minimum force',
      option2: 'F_\\perp', option2Meaning: 'perpendicular force',
      option3: 'F_{net}', option3Meaning: 'net force',
      option4: 'F', option4Meaning: 'applied force',
      correctAnswer1: 'F_\\perp',
  ), //M9
  FormulaQuizQuestionSet(
    id: 'M10',

    description: 'Moment (torque) of a force',
      correctEquation: '\\text{moment}=F\\times d_\\perp',
      moreInfoCorrectEq: [ 'F \\text{: force}', 'd \\text{: perpendicular distance from pivot}'],
      equationQ: ReusableEquation(textLT1:'\\scriptsize\\text{moment}' , boxRT: true, textRT2: '\\times d_\\perp' ),
    moreInfoQ: [ 'd \\text{: perpendicular distance from pivot}'],
    option1: 'F_{min}', option1Meaning: 'minimum force',
      option2: 'F_\\perp', option2Meaning: 'perpendicular force',
      option3: 'F_{net}', option3Meaning: 'net force',
      option4: 'F', option4Meaning: 'force',
      correctAnswer1: 'F',
  ), //M10
];

List<FormulaQuizQuestionSet> energy =[
  FormulaQuizQuestionSet(
      id: 'M11',

      description: 'Work Done',
      correctEquation: 'W=Fs',
      moreInfoCorrectEq: [ 'W \\text{: work done}', 'F \\text{: applied force}', 's \\text{: displacement}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, textRT2: 's', ),
      moreInfoQ: [ 's \\text{: displacement}'],
      option1: 'W', option1Meaning: 'work done',
      option2: 'F_{net}', option2Meaning: 'net force',
  option3: 'F', option3Meaning: 'applied force',
  option4: 'F_\\perp', option4Meaning: 'perpendicular force',
  correctAnswer1: 'F',
      correctAnswer2: 'W'
  ), // M11
  FormulaQuizQuestionSet(
      id: 'M12',
      description: 'Power',
      correctEquation: 'P=\\frac Et',
      moreInfoCorrectEq: [ 'P \\text{: power}', 'E \\text{: energy transfer}', 't \\text{: time}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, lineRight: true, textRB1: 't', ),
      moreInfoQ: [ 't \\text{: time}'],

      option1: 'E', option1Meaning: 'energy transfer',
      option2: 'P', option2Meaning: 'power',
      option3: 's', option3Meaning: 'displacement',
      option4: 'v', option4Meaning: 'velocity',
      correctAnswer1: 'E',
      correctAnswer2: 'P'
  ), //M12
  FormulaQuizQuestionSet(
      id: 'M13',

      description: 'Power of an object moving at constant velocity',
      correctEquation: 'P=Fv',
      moreInfoCorrectEq: [ 'P \\text{: power}', 'F \\text{: applied force}', 'v \\text{: velocity}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true ,textRT2: 'v'),
      moreInfoQ: ['v \\text{: velocity}'],
      option1: 'E', option1Meaning: 'energy transferred',
      option2: 'P', option2Meaning: 'power',
      option3: 'F_{net}', option3Meaning: 'net force',
      option4: 'F', option4Meaning: 'applied force',
      correctAnswer1: 'F',
      correctAnswer2: 'P'
  ), //M13
  FormulaQuizQuestionSet(
      id: 'M14',

      description: 'Kinetic energy',
      correctEquation: 'KE=\\frac12mv^2',
      moreInfoCorrectEq: [ 'KE \\text{: kinetic energy}', 'm \\text{: mass}', 'v \\text{: velocity}'],
      equationQ: ReusableEquation(boxLT: true,textRT1: '\\frac 12m', boxRT: true),
      moreInfoQ: [ 'm \\text{: mass}'],
      option1: 'KE', option1Meaning: 'kinetic energy',
      option2: 'v', option2Meaning: 'velocity',
      option3: 'v^2', option3Meaning: 'square of velocity',
      option4: 'F', option4Meaning: 'applied force',
      correctAnswer1: 'v^2',
      correctAnswer2: 'KE'
  ), //M14
  FormulaQuizQuestionSet(
      id: 'M15',

      description: 'Gravitational potential energy',
      correctEquation: 'PE=mgh',
      moreInfoCorrectEq: [ 'PE \\text{: gravitational potential energy}', 'm \\text{: mass}',
        'g \\text{: acceleration due to gravity}', 'h \\text{: height}'],
      equationQ: ReusableEquation(boxLT: true,textRT1: 'm', boxRT: true, textRT2: 'h',),
      moreInfoQ: [ 'm \\text{: mass}', 'h \\text{: height}'],
      option1: 'PE', option1Meaning: 'gravitational potential energy',
      option2: 'G', option2Meaning: 'universal gravitational constant',
      option3: 'v^2', option3Meaning: 'square of velocity',
      option4: 'g', option4Meaning: 'acceleration due to gravity',
      correctAnswer1: 'g',
      correctAnswer2: 'PE'
  ) //M15
];

List<FormulaQuizQuestionSet> momentum =[
  FormulaQuizQuestionSet(
      id: 'M16',

      description: 'Momentum',
      correctEquation: '\\text{momentum}=mv',
      moreInfoCorrectEq: [ 'm \\text{: mass}', 'v \\text{: velocity}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, textRT2: 'v', ),
      moreInfoQ: [ 'v \\text{: velocity}'],
      option1: 's', option1Meaning: 'displacement',
      option2: 'p', option2Meaning: 'momentum',
      option3: 'F', option3Meaning: 'applied force',
      option4: 'm', option4Meaning: 'mass',
      correctAnswer1: 'm',
      correctAnswer2: 'p'
  ), // M16
  FormulaQuizQuestionSet(
      id: 'M17',

      description: 'Momentum and Newton’s second law',
      correctEquation: 'F_{net}t = mv-mu',
      moreInfoCorrectEq: [ 'F_{net} \\text{: net force}','t \\text{: time}',
        'm \\text{: mass}', 'v \\text{: final velocity}', 'u \\text{: initial velocity}'],
      equationQ: ReusableEquation(boxLT: true, textLT2: 't',  textRT1: 'mv-m', boxRT: true, ),
      moreInfoQ: [ 't \\text{: time}', 'm \\text{: mass}', 'v \\text{: final velocity}'],
      option1: 's', option1Meaning: 'displacement',
      option2: 'F_{net}', option2Meaning: 'net force',
      option3: 'F', option3Meaning: 'applied force',
      option4: 'u', option4Meaning: 'initial velocity',
      correctAnswer1: 'u',
      correctAnswer2: 'F_{net}'
  ), // M17
  FormulaQuizQuestionSet(
      id: 'M18',

      description: 'Conservation of momentum for two-object collision',
      correctEquation: '\\small m_1u_1+ m_2u_2=m_1v_1+m_2v_2',
      moreInfoCorrectEq: [ 'm_1 \\text{: mass of object 1}','m_2 \\text{: mass of object 2}',
        'u_1 \\text{: initial velocity of object 1}', 'u_2 \\text{: initial velocity of object 2}',
        'v_1 \\text{: final velocity of object 1}', 'v_2 \\text{: final velocity of object 2}'],
      equationQ: ReusableEquation(textLT1: '\\small m_1' ,boxLT: true, textLT2: '\\small +m_2u_2',  textRT1: '\\small m_1v_1+', boxRT: true, textRT2: '\\small v_2', ),
      moreInfoQ: [ 'm_1 \\text{: mass of object 1}','m_2 \\text{: mass of object 2}', 'u_2 \\text{: initial velocity of object 2}',
        'v_1 \\text{: final velocity of object 1}', 'v_2 \\text{: final velocity of object 2}'],
      option1: 'm_1', option1Meaning: 'mass of object 1',
      option2: 'v_1', option2Meaning: 'final velocity of object 1',
      option3: 'u_1', option3Meaning: 'initial velocity of object 1',
      option4: 'm_2', option4Meaning: 'mass of object 2',
      correctAnswer1: 'm_2',
      correctAnswer2: 'u_1'
  ), //M18
];

List<FormulaQuizQuestionSet> circularMotion =[
  FormulaQuizQuestionSet(
      id: 'M19',

      description: 'Angle in radian',
      correctEquation: '\\theta=\\frac sr',
      moreInfoCorrectEq: [ '\\theta \\text{: angle in radian}','s \\text{: arc length}',
        'r \\text{: radius}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, lineRight: true, textRB1: 'r' ),
      moreInfoQ: [ 'r \\text{: radius}'],
      option1: 's', option1Meaning: 'arc length',
      option2: 'p', option2Meaning: 'momentum',
      option3: '\\theta', option3Meaning: 'angle in radian',
      option4: 'm', option4Meaning: 'mass',
      correctAnswer1: 's',
      correctAnswer2: '\\theta'
  ), // M19
  FormulaQuizQuestionSet(
    id: 'M20',

    description: 'Radian and degree',
      correctEquation: '2\\pi\\text{ rad}=360^\\circ',
      moreInfoCorrectEq: [],
      equationQ: ReusableEquation( textLT1: '2\\pi\\text{ rad}', boxRT: true, textRT2: '^\\circ' ),
      moreInfoQ: [],
      option1: '90',
      option2: '180',
      option3: '270',
      option4: '360',
      correctAnswer1: '360',
  ), // M20
  FormulaQuizQuestionSet(
    id: 'M21',

    description: 'Angular velocity',
      correctEquation: '\\omega=\\frac\\theta t',
      moreInfoCorrectEq: [ '\\omega \\text{: angular velocity}','\\theta \\text{: angular displacement}',
        't \\text{: time}'],
      equationQ: ReusableEquation(boxLT: true, boxRB: true, lineRight: true, textRT1: '\\theta' ),
      moreInfoQ: [ '\\theta \\text{: angular displacement}'],
      option1: '\\omega', option1Meaning: 'angular velocity',
      option2: 's', option2Meaning: 'displacement',
      option3: 'T', option3Meaning: 'period',
      option4: 't', option4Meaning: 'time',
      correctAnswer1: 't',
      correctAnswer2: '\\omega',
      twoWayAns: true,
  ),//M21
  FormulaQuizQuestionSet(
      id: 'M22',
      description: 'Angular velocity',
      correctEquation: '\\omega=\\frac{2\\pi}{T}',
      moreInfoCorrectEq: [ '\\omega \\text{: angular velocity}','T \\text{: period}'],
      equationQ: ReusableEquation(boxLT: true, boxRB: true, lineRight: true, textRT1: '2\\pi' ),
      moreInfoQ: [],
      option1: '\\omega', option1Meaning: 'angular velocity',
      option2: 's', option2Meaning: 'displacement',
      option3: 'T', option3Meaning: 'period',
      option4: 't', option4Meaning: 'time',
      correctAnswer1: 'T',
      correctAnswer2: '\\omega',
      twoWayAns: true,

  ),//M22
  FormulaQuizQuestionSet(
      id: 'M23',
      description: 'Angular velocity and linear velocity',
      correctEquation: 'v=r\\omega',
      moreInfoCorrectEq: [ 'v \\text{: linear velocity}', 'r \\text{: radius}' ,
        '\\omega \\text{: angular velocity}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'r', boxRT: true  ),
      moreInfoQ: ['r \\text{: radius}'],
      option1: '\\omega', option1Meaning: 'angular velocity',
      option2: 'v', option2Meaning: 'linear velocity',
      option3: 'T', option3Meaning: 'period',
      option4: '\\theta', option4Meaning: 'angular displacement',
      correctAnswer1: '\\omega',
      correctAnswer2: 'v'
  ),//M23
  FormulaQuizQuestionSet(
      id: 'M24',
      description: 'Centripetal force',
      correctEquation: 'F_c = \\frac {mv^2}{r}',
      moreInfoCorrectEq: [ 'F_c \\text{: centripetal force}', 'm \\text{: mass}' ,
        'v \\text{: linear velocity}', 'r \\text{: radius}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'm', boxRT: true, lineRight: true, textRB1: 'r'  ),
      moreInfoQ: [ 'm \\text{: mass}' , 'r \\text{: radius}'],
      option1: '\\omega^2', option1Meaning: 'square of angular velocity',
      option2: 'v^2', option2Meaning: 'square of linear velocity',
      option3: 'F_c', option3Meaning: 'centripetal force',
      option4: '\\theta', option4Meaning: 'angular displacement',
      correctAnswer1: 'v^2',
      correctAnswer2: 'F_c'
  ),//M24
  FormulaQuizQuestionSet(
      id: 'M25',
      description: 'Centripetal force',
      correctEquation: 'F_c=m\\omega^2r',
      moreInfoCorrectEq: [ 'F_c \\text{: centripetal force}', 'm \\text{: mass}' ,
        '\\omega \\text{: angular velocity}', 'r \\text{: radius}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'm', boxRT: true,textRT2: 'r'  ),
      moreInfoQ: [ 'm \\text{: mass}' , 'r \\text{: radius}'],
      option1: '\\omega^2', option1Meaning: 'square of angular velocity',
      option2: 'v^2', option2Meaning: 'square of linear velocity',
      option3: 'F_c', option3Meaning: 'centripetal force',
      option4: '\\theta', option4Meaning: 'angular displacement',
      correctAnswer1: '\\omega^2',
      correctAnswer2: 'F_c'
  ),//M25
  FormulaQuizQuestionSet(
      id: 'M26',
      description: 'Centripetal acceleration',
      correctEquation: 'a_c=\\frac{v^2}r',
      moreInfoCorrectEq: [ 'a_c \\text{: centripetal acceleration}', 'v \\text{: linear velocity}',
        'r \\text{: radius}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true,lineRight: true, textRB1: 'r'  ),
      moreInfoQ: ['r \\text{: radius}'],
      option1: '\\omega^2', option1Meaning: 'square of angular velocity',
      option2: 'v^2', option2Meaning: 'square of linear velocity',
      option3: 'a_c', option3Meaning: 'centripetal acceleration',
      option4: 'v', option4Meaning: 'linear velocity',
      correctAnswer1: 'v^2',
      correctAnswer2: 'a_c'
  ),//M26
  FormulaQuizQuestionSet(
      id: 'M27',
      description: 'Centripetal acceleration',
      correctEquation: 'a_c=\\omega^2r',
      moreInfoCorrectEq: [ 'a_c \\text{: centripetal acceleration}', '\\omega \\text{: angular velocity}',
        'r \\text{: radius}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, textRT2: 'r'  ),
      moreInfoQ: ['r \\text{: radius}'],
      option1: '\\omega^2', option1Meaning: 'square of angular velocity',
      option2: 'v^2', option2Meaning: 'square of linear velocity',
      option3: 'a_c', option3Meaning: 'centripetal acceleration',
      option4: 'v', option4Meaning: 'linear velocity',
      correctAnswer1: '\\omega^2',
      correctAnswer2: 'a_c'
  ),//M27
  FormulaQuizQuestionSet(
      id: 'M28',
      description: 'Useful equation for conical pendulum (uniform circular motion)',
      correctEquation: '\\tan\\theta=\\frac{v^2}{gr}',
      moreInfoCorrectEq: [ '\\theta \\text{: angle between vertical and tension}', 'v \\text{: linear velocity}',
        'g \\text{: acceleration due to gravity}','r \\text{: radius of circular path}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, lineRight: true, textRB1: 'gr'  ),
      moreInfoQ: [ 'g \\text{: acceleration due to gravity}','r \\text{: radius of circular path}'],
      option1: '\\tan\\theta', option1Meaning: 'tangent of angle between vertical and tension',
      option2: 'v^2', option2Meaning: 'square of linear velocity',
      option3: '\\omega^2', option3Meaning: 'square of angular velocity',
      option4: 'v', option4Meaning: 'linear velocity',
      correctAnswer1: 'v^2',
      correctAnswer2: '\\tan\\theta'
  ),//M28
];

List<FormulaQuizQuestionSet> gravitation =[
  FormulaQuizQuestionSet(
      id: 'M29',
      description: 'Gravitational Force',
      correctEquation: 'F_g = \\frac {GMm}{r^2}',
      moreInfoCorrectEq: [ 'F_g \\text{: gravitational force}', 'G \\text{: gravitational constant}',
        'M \\text{: mass of object 1}','m \\text{: mass of object 2}','r \\text{: radius of circular path}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'GM',boxRT: true, lineRight: true, textRB1: 'r^2'  ),
      moreInfoQ: [  'G \\text{: gravitational constant}', 'M \\text{: mass of object 1}',
        'r \\text{: radius of circular path}'],
      option1: '\\theta', option1Meaning: 'angular displacement',
      option2: 'v^2', option2Meaning: 'square of linear velocity',
      option3: 'm', option3Meaning: 'mass of object 2',
      option4: 'F_g', option4Meaning: 'gravitational force',
      correctAnswer1: 'm',
      correctAnswer2: 'F_g'
  ),//M29
  FormulaQuizQuestionSet(
      id: 'M30',
      description: 'Orbital radius and period',
    correctEquation: '\\frac{GM}{4\\pi^2}=\\frac{r^3}{T^2}',
      moreInfoCorrectEq: [ 'G \\text{: gravitational constant}',
        'M \\text{: mass of planet}','r \\text{: radius of circular path}',
        'T \\text{: period}'],
    equationQ: ReusableEquation(textLT1: 'GM', lineLeft: true, boxLB: true, boxRT: true, lineRight: true, textRB1: 'T^2'  ),
      moreInfoQ: [ 'G \\text{: gravitational constant}',
        'M \\text{: mass of planet}', 'T \\text{: period}'],
    option1: 'r^3', option1Meaning: 'orbital radius to the power 3',
    option2: 'r^2', option2Meaning: 'orbital radius to the power 2',
    option3: '4\\pi^2',
    option4: '\\pi^2',
    correctAnswer1: 'r^3',
    correctAnswer2: '4\\pi^2'
),//M30
  FormulaQuizQuestionSet(
      id: 'M31',

      description: 'Gravitational field strength',
      correctEquation: 'g=\\frac Fm',
      moreInfoCorrectEq: [ 'g \\text{: gravitational field strength}',
        'F \\text{: gravitational force}','m \\text{: mass of test mass}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, lineRight: true, textRB1: 'm'  ),
      moreInfoQ: [ 'm \\text{: mass of test mass}'],
      option1: 'g', option1Meaning: 'gravitational field strength',
      option2: 'F', option2Meaning: 'gravitational force',
      option3: 'G', option3Meaning: 'universal gravitational constant',
      option4: 'V', option4Meaning: 'volume',
      correctAnswer1: 'F',
      correctAnswer2: 'g'
  ),//M31
  FormulaQuizQuestionSet(
      id: 'M32',
      description: 'Gravitational field strength',
      correctEquation: 'g=\\frac{GM}{r^2}',
      moreInfoCorrectEq: [ 'g \\text{: gravitational field strength}',
        'G \\text{: gravitational constant}','M \\text{: mass of object}', 'r \\text{: distance from object}'],
      equationQ: ReusableEquation(boxLT: true, boxRB: true, lineRight: true, textRT1: 'GM'  ),
      moreInfoQ: ['G \\text{: gravitational constant}','M \\text{: mass of object}'],
      option1: 'g', option1Meaning: 'gravitational field strength',
      option2: 'F', option2Meaning: 'gravitational force',
      option3: 'r^2', option3Meaning: 'square of distance from object',
      option4: 'r', option4Meaning: 'distance from object',
      correctAnswer1: 'r^2',
      correctAnswer2: 'g'
  ),//M32
  ];

List<FormulaQuizQuestionSet> wave =[
  FormulaQuizQuestionSet(
    id: 'W1',

    description: 'Frequency',
      correctEquation: 'f=\\frac 1T',
      moreInfoCorrectEq: [ 'f \\text{: frequency}',
        'T \\text{: period}'],
      equationQ: ReusableEquation(boxLT: true, boxRB: true, lineRight: true, textRT1: '1'  ),
      moreInfoQ: [],
      option1: 't', option1Meaning: 'time',
      option2: 'T', option2Meaning: 'period',
      option3: 'f', option3Meaning: 'frequency',
      option4: 'v', option4Meaning: 'speed',
      correctAnswer1: 'T',
      correctAnswer2: 'f',
    twoWayAns: true,
  ),//W1
  FormulaQuizQuestionSet(
      id: 'W2',

      description: 'The wave equation',
      correctEquation: 'v=f\\lambda',
      moreInfoCorrectEq: [ 'v \\text{: speed}', 'f \\text{: frequency}' , '\\lambda \\text{: wavelength}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, textRT1: 'f'  ),
      moreInfoQ: [ 'f \\text{: frequency}'],
      option1: 't', option1Meaning: 'time',
      option2: 'T', option2Meaning: 'period',
      option3: '\\lambda', option3Meaning: 'wavelength',
      option4: 'v', option4Meaning: 'speed',
      correctAnswer1: '\\lambda',
      correctAnswer2: 'v'
  ),//W2
  FormulaQuizQuestionSet(
    id: 'W3',

    description: 'Refraction',
      correctEquation: '\\frac{\\sin\\theta_1}{\\sin\\theta_2}=\\frac{v_1}{v_2}',
      moreInfoCorrectEq: [ '\\theta_1 \\text{: angle from normal in medium 1}', '\\theta_2 \\text{: angle from normal in medium 2}',
        '{v_1} \\text{: speed at medium 1}', '{v_2} \\text{: speed at medium 2}'],
      equationQ: ReusableEquation(textLT1: '\\frac{\\sin\\theta_1}{\\sin\\theta_2}', boxRT: true ),
      moreInfoQ: [ '\\theta_1 \\text{: angle from normal in medium 1}', '\\theta_2 \\text{: angle from normal in medium 2}'],
      option1: 'v_1', option1Meaning: 'speed at medium 1',
      option2: '\\frac{v_1}{v_2}', option2Meaning: 'speed at medium 1 to speed at medium 2',
      option3: '\\frac{v_2}{v_1}', option3Meaning: 'speed at medium 2 to speed at medium 1',
      option4: 'v_2', option4Meaning: 'speed at medium 2',
      correctAnswer1: '\\frac{v_1}{v_2}',
      // correctAnswer2: 'v'
  ),//W3
  FormulaQuizQuestionSet(
    id: 'W4',

    description: 'Refraction',
    correctEquation: '\\frac{\\sin\\theta_1}{\\sin\\theta_2}=\\frac{\\lambda_1}{\\lambda_2}',
    moreInfoCorrectEq: [ '\\theta_1 \\text{: angle from normal in medium 1}', '\\theta_2 \\text{: angle from normal in medium 2}',
      '{\\lambda_1} \\text{: wavelength at medium 1}', '{\\lambda_2} \\text{: wavelength at medium 2}'],
    equationQ: ReusableEquation(textLT1: '\\frac{\\sin\\theta_1}{\\sin\\theta_2}', boxRT: true ),
    moreInfoQ: [ '\\theta_1 \\text{: angle from normal in medium 1}', '\\theta_2 \\text{: angle from normal in medium 2}'],
    option1: '\\lambda_1', option1Meaning: 'wavelength at medium 1',
    option2: '\\frac{\\lambda_1}{\\lambda_2}', option2Meaning: 'wavelength at medium 1 to wavelength at medium 2',
    option3: '\\frac{\\lambda_2}{\\lambda_1}', option3Meaning: 'wavelength at medium 2 to wavelength at medium 1',
    option4: '\\lambda_2', option4Meaning: 'wavelength at medium 2',
    correctAnswer1: '\\frac{\\lambda_1}{\\lambda_2}',
    // correctAnswer2: 'v'
  ),//W4
  FormulaQuizQuestionSet(
      id: 'W5',

      description: 'Double-slit',
    correctEquation: '\\Delta y = \\frac {\\lambda D} {d}',
      moreInfoCorrectEq: [ '\\Delta y \\text{: fringe separation}', '\\lambda \\text{: wavelength}',
        'D \\text{: screen and double-slit separation}', 'd \\text{: slit separation}'],
    equationQ: ReusableEquation(boxLT: true, lineRight: true, boxRT: true, textRT1: '\\lambda', textRB1: 'd', ),
      moreInfoQ: [ '\\lambda \\text{: wavelength}', 'd \\text{: slit separation}'],
    option1: 'D', option1Meaning: 'screen and double-slit separation',
    option2: '\\Delta y', option2Meaning: 'fringe separation',
    option3: '\\Delta t', option3Meaning: 'time interval',
    option4: 'n', option4Meaning: 'order of fringe',
    correctAnswer1: 'D',
    correctAnswer2: '\\Delta y'
  ),  //W5
  FormulaQuizQuestionSet(
      id: 'W6',
      description: 'Diffraction grating equation',
      correctEquation: 'd \\sin \\theta = n \\lambda',
      moreInfoCorrectEq: [ 'd \\text{: slit separation}', '\\begin{array}{l}\\theta \\text{: angle between maxima} \\\\ \\text{and central maximum}\\end{array}',
        'n \\text{: no. of order of maximum}', '\\lambda \\text{: wavelength}'],
      equationQ: ReusableEquation(boxLT: true, textLT2: '\\sin \\theta', boxRT: true, textRT2: '\\lambda'),
      moreInfoQ: ['\\begin{array}{c}\\theta \\text{: angle between maxima} \\\\ \\text{and central maximum}\\end{array}',
        '\\lambda \\text{: wavelength}'],
      option1: 'D', option1Meaning: 'screen and double-slit separation',
      option2: 'd', option2Meaning: 'slit separation',
      option3: '\\Delta y', option3Meaning: 'fringe separation',
      option4: 'n', option4Meaning: 'order of maximum',
      correctAnswer1: 'n',
      correctAnswer2: 'd'
  )     //W6
  ];

List<FormulaQuizQuestionSet> optics =[
  FormulaQuizQuestionSet(
      id: 'OP1',

      description: 'Snell’s law',
      correctEquation: 'n_1 \\sin \\theta_1 = n_2 \\sin \\theta_2',
      moreInfoCorrectEq: [ '\\begin{array}{c}n_1 \\text{: refractive index} \\\\ \\text{of medium 1}\\end{array}',
        '\\begin{array}{c}n_2 \\text{: refractive index} \\\\ \\text{of medium 2}\\end{array}',
        '\\begin{array}{c}\\theta_1 \\text{: angle from normal} \\\\ \\text{in medium 1}\\end{array}',
        '\\begin{array}{c}\\theta_2 \\text{: angle from normal} \\\\ \\text{in medium 2}\\end{array}',],
      equationQ: ReusableEquation(boxLT: true, textLT2: '\\sin \\theta_1', boxRT: true, textRT2: '\\sin \\theta_2'),
      moreInfoQ: [
        '\\begin{array}{c}\\theta_1 \\text{: angle from normal} \\\\ \\text{in medium 1}\\end{array}',
        '\\begin{array}{c}\\theta_2 \\text{: angle from normal} \\\\ \\text{in medium 2}\\end{array}',],
      option1: 'c', option1Meaning: 'speed of light',
      option2: 'n_1', option2Meaning: 'refractive index of medium 1',
      option3: 'f', option3Meaning: 'frequency',
      option4: 'n_2', option4Meaning: 'refractive index of medium 2',
      correctAnswer1: 'n_2',
      correctAnswer2: 'n_1'
  ),//OP1
  FormulaQuizQuestionSet(
    id: 'OP2',

    description: 'Refractive index',
      correctEquation: 'n=\\frac cv',
    moreInfoCorrectEq: [ 'n \\text{: refractive index}',
      'c \\text{: speed of light in vacuum}', 'v \\text{: speed in medium}'],
      equationQ: ReusableEquation( textLT1: 'n', boxRT: true),
    moreInfoQ: [ 'n \\text{: refractive index}',],
      option1: '\\frac cv', option1Meaning: 'speed of light in vacuum/speed in the medium',
      option2: '\\frac vc', option2Meaning: 'speed in medium/speed of light in vacuum',
      option3: '\\frac fc', option3Meaning: 'frequency/speed of light in vacuum',
      option4: '\\frac cf', option4Meaning: 'speed of light in vacuum/frequency',
      correctAnswer1: '\\frac cv',
      // correctAnswer2: 'n_1'
  ),//OP2
  FormulaQuizQuestionSet(
    id: 'OP3',

    description: 'Critical angle (one medium is air/vacuum)',
    correctEquation: '\\sin C = \\frac 1n',
      moreInfoCorrectEq: [ 'C \\text{: critical angle}',
        'n \\text{: refractive index}'],
    equationQ: ReusableEquation( boxLT: true, boxRT: true),
      moreInfoQ: [],
    option1: '\\sin C', option1Meaning: 'sine of critical angle',
    option2: '\\frac 1n', option2Meaning: '1 / refractive index',
    option3: 'n', option3Meaning: 'refractive index',
    option4: 'n^2', option4Meaning: 'square of refractive index',
    correctAnswer1: '\\frac 1n',
    correctAnswer2: '\\sin C',
    twoWayAns: true,
  ),//OP3
  FormulaQuizQuestionSet(
    id: 'OP4',

    description: 'Critical angle (neither medium is air/vacuum)',
      correctEquation: '\\sin C=\\frac{n_1}{n_2}',
      moreInfoCorrectEq: [ 'C \\text{: critical angle}',
        'n_1 \\text{: refractive index of medium 1}', 'n_2 \\text{: refractive index of medium 2}'],
      equationQ: ReusableEquation( boxLT: true, boxRT: true),
      moreInfoQ: [],
      option1: '\\sin C', option1Meaning: 'sine of critical angle',
      option2: '\\frac {n_2}{n_1}', option2Meaning: 'larger refractive index\n   /smaller refractive index',
      option3: '\\frac {n_1}{n_2}', option3Meaning: 'smaller refractive index\n   /larger refractive index',
      option4: 'n^2', option4Meaning: 'square of refractive index',
      correctAnswer1: '\\frac {n_1}{n_2}',
      correctAnswer2: '\\sin C',
      twoWayAns: true,
  ),//OP4
  FormulaQuizQuestionSet(
      id: 'OP5',

      description: 'Lens Formula',
      correctEquation: '\\frac1u+\\frac1v=\\frac1f',
      moreInfoCorrectEq: [ 'u \\text{: object distance}',
        'v \\text{: image distance}', 'f \\text{: focal length}'],
      equationQ: ReusableEquation(textLT1: '\\frac1u+', boxLT: true, boxRT: true),
      moreInfoQ: [ 'u \\text{: object distance}'],
      option1: '\\frac1n', option1Meaning: '1/refractive index',
      option2: '\\frac1f', option2Meaning: '1/focal length',
      option3: '\\frac1v', option3Meaning: '1/image distance',
      option4: '\\frac1c', option4Meaning: '1/speed of light in vacuum',
      correctAnswer1: '\\frac1f',
      correctAnswer2: '\\frac1v'
  ),//OP5
  ];

List<FormulaQuizQuestionSet> electrostatics =[
  FormulaQuizQuestionSet(
      id: 'E1',

      description: 'Coulomb’s Law',
      correctEquation: 'F=\\frac1{4\\pi\\varepsilon_0}\\frac{Q_1Q_2}{r^2}',
      moreInfoCorrectEq: [ 'F \\text{: electrostatic force}',
        'Q_1 \\text{: charge of charge 1}', 'Q_2 \\text{: charge of charge 2}', '\\varepsilon_0 \\text{: permittivity of free space}'
        , 'r \\text{: distance between 2 charges}'],
      equationQ: ReusableEquation( boxLT: true, textRT1: 'Q_1Q_2', lineRight: true, textRB1:'4\\pi\\varepsilon_0', boxRB: true),
      moreInfoQ: [
        'Q_1 \\text{: charge of charge 1}', 'Q_2 \\text{: charge of charge 2}', '\\varepsilon_0 \\text{: permittivity of free space}'
      ],
      option1: 'r', option1Meaning: 'distance between 2 charges',
      option2: 'F', option2Meaning: 'electrostatic force',
      option3: 'r^3', option3Meaning: 'distance between 2 charges to the power 3',
      option4: 'r^2', option4Meaning: 'square of distance between 2 charges',
      correctAnswer1: 'r^2',
      correctAnswer2: 'F'
  ),//E1
  FormulaQuizQuestionSet(
      id: 'E2',

      description: 'Electric field strength',
      correctEquation: 'E =\\frac Fq',
      moreInfoCorrectEq: [ 'E \\text{: electric field strength}',
        'F \\text{: electrostatic force}', 'q \\text{: charge of test charge}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'F', lineRight: true, boxRB: true),
      moreInfoQ: ['F \\text{: electrostatic force}'],
      option1: 'r', option1Meaning: 'distance from the charge',
      option2: 'E', option2Meaning: 'electric field strength',
      option3: 'q^2', option3Meaning: 'square of charge of test charge',
      option4: 'q', option4Meaning: 'charge of test charge',
      correctAnswer1: 'q',
      correctAnswer2: 'E'
  ),//E2
  FormulaQuizQuestionSet(
      id: 'E3',

      description: 'Electric field strength due to a point charge',
      correctEquation: 'E=\\frac1{4\\pi\\varepsilon_0}\\frac Q{r^2}',
      moreInfoCorrectEq: [ 'E \\text{: electric field strength}',
        'Q \\text{: charge of the point charge}', '\\varepsilon_0 \\text{: permittivity of free space}',
            'r \\text{: distance from the point charge}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, lineRight: true, textRB1:'4\\pi\\varepsilon_0 r^2'),
      moreInfoQ: [  '\\varepsilon_0 \\text{: permittivity of free space}',
            'r \\text{: distance from the point charge}'],
      option1: 'm', option1Meaning: 'mass of point charge',
      option2: 'E', option2Meaning: 'Electric field strength',
      option3: 'Q^2', option3Meaning: 'square of charge',
      option4: 'Q', option4Meaning: 'charge of the point charge',
      correctAnswer1: 'Q',
      correctAnswer2: 'E'
  ),//E3
  FormulaQuizQuestionSet(
      id: 'E4',

      description: 'Electric field between two parallel charged plates',
      correctEquation: 'E = \\frac Vd',
      moreInfoCorrectEq: [  'E \\text{: Electric field strength}',
        'V \\text{: potential difference between 2 plates}',
      'd \\text{: separation between 2 plates}'
      ],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, lineRight: true, textRB1:'d'),
      moreInfoQ: [
        'd \\text{: separation between 2 plates}'
      ],
      option1: 'm', option1Meaning: 'mass of point charge',
      option2: 'E', option2Meaning: 'Electric field strength',
      option3: 'V', option3Meaning: 'potential difference between 2 plates',
      option4: 'F', option4Meaning: 'electrostatic force',
      correctAnswer1: 'V',
      correctAnswer2: 'E'
  ),//E4

  ];

List<FormulaQuizQuestionSet> circuit = [
  FormulaQuizQuestionSet(
      id: 'E5',

      description: 'Current',
      correctEquation: 'I=\\frac Qt',
      moreInfoCorrectEq: [  'I \\text{: current}',
        'Q \\text{: charge}',
        't \\text{: time}'
      ],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, lineRight: true, textRB1:'t'),
      moreInfoQ: ['t \\text{: time}'],
      option1: 'Q', option1Meaning: 'charge',
      option2: 'v', option2Meaning: 'velocity',
      option3: 'E', option3Meaning: 'energy',
      option4: 'I', option4Meaning: 'current',
      correctAnswer1: 'Q',
      correctAnswer2: 'I'
  ),//E5
  FormulaQuizQuestionSet(
      id: 'E6',

      description: 'Voltage',
      correctEquation: 'V=\\frac EQ',
      moreInfoCorrectEq: [  'V \\text{: voltage}',
        'E \\text{: energy}',
        'Q \\text{: charge}'
      ],
      equationQ: ReusableEquation(boxLT: true, boxRB: true, lineRight: true, textRT1:'E'),
      moreInfoQ: [
        'E \\text{: energy}',
      ],
      option1: 'Q', option1Meaning: 'charge',
      option2: 'V', option2Meaning: 'voltage',
      option3: 'e', option3Meaning: 'charge of 1 electron',
      option4: 'E', option4Meaning: 'energy',
      correctAnswer1: 'Q',
      correctAnswer2: 'V'
  ),//E6
  FormulaQuizQuestionSet(
      id: 'E7',

      description: 'Ohm’s Law',
      correctEquation: 'V=IR',
      moreInfoCorrectEq: [  'V \\text{: voltage}',
        'I \\text{: current}',
        'R \\text{: resistance}'
      ],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, textRT2:'R'),
      moreInfoQ: [
        'R \\text{: resistance}'
      ],
      option1: 'Q', option1Meaning: 'charge',
      option2: 'V', option2Meaning: 'voltage',
      option3: 'I', option3Meaning: 'current',
      option4: 'E', option4Meaning: 'energy',
      correctAnswer1: 'I',
      correctAnswer2: 'V'
  ),//E7
  FormulaQuizQuestionSet(
      id: 'E8',

      description: 'Resistivity',
      correctEquation: 'R=\\rho\\frac lA',
      moreInfoCorrectEq: [  'R \\text{: resistance}',
        '\\rho \\text{: resistivity}',
        'l \\text{: length of wire}',
        'A \\text{: cross-sectional area of wire}'
      ],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, textRT2:'\\frac lA'),
      moreInfoQ: [
        'l \\text{: length of wire}',
        'A \\text{: cross-sectional area of wire}'
      ],
      option1: 'R', option1Meaning: 'resistance',
      option2: 'V', option2Meaning: 'voltage',
      option3: '\\rho', option3Meaning: 'resistivity',
      option4: 'I', option4Meaning: 'current',
      correctAnswer1: '\\rho',
      correctAnswer2: 'R'
  ),//E8
  FormulaQuizQuestionSet(
      id: 'E9',

      description: 'Terminal voltage for cell with internal resistance',
      correctEquation: 'V = \\varepsilon - Ir',
      moreInfoCorrectEq: [  'V \\text{: terminal voltage}',
        '\\varepsilon \\text{: electromagnetic force of cell}',
        'I \\text{: current}',
        'r \\text{: internal resistance of cell}'
      ],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, textRT2:'- Ir'),
      moreInfoQ: [
        'I \\text{: current}',
        'r \\text{: internal resistance of cell}'
      ],
      option1: 'R', option1Meaning: 'resistance',
      option2: 'V', option2Meaning: 'terminal voltage',
      option3: '\\rho', option3Meaning: 'resistivity',
      option4: '\\varepsilon', option4Meaning: 'electromagnetic force of cell',
      correctAnswer1: '\\varepsilon',
      correctAnswer2: 'V'
  ),//E9
  FormulaQuizQuestionSet(
      id: 'E10',

      description: 'Power in a circuit',
      correctEquation: 'P=IV',
      moreInfoCorrectEq: [  'P \\text{: power}',
        'I \\text{: current}',
        'V \\text{: voltage}'
      ],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, textRT2:'V'),
      moreInfoQ: [
        'V \\text{: voltage}'
      ],
      option1: 'R', option1Meaning: 'resistance',
      option2: 'P', option2Meaning: 'power',
      option3: '\\rho', option3Meaning: 'resistivity',
      option4: 'I', option4Meaning: 'current',
      correctAnswer1: 'I',
      correctAnswer2: 'P'
  ),//E10
  FormulaQuizQuestionSet(
      id: 'E11',

      description: 'Power in a circuit',
      correctEquation: 'P=I^2R',
      moreInfoCorrectEq: [  'P \\text{: power}',
        'I \\text{: current}',
        'R \\text{: resistance}'
      ],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, textRT2:'R'),
      moreInfoQ: [
        'R \\text{: resistance}'
      ],
      option1: 'V^2', option1Meaning: 'square of voltage',
      option2: 'P', option2Meaning: 'power',
      option3: 'I^2', option3Meaning: 'square of current',
      option4: 'I', option4Meaning: 'current',
      correctAnswer1: 'I^2',
      correctAnswer2: 'P'
  ),//E11
  FormulaQuizQuestionSet(
      id: 'E12',

      description: 'Power in a circuit',
      correctEquation: 'P=\\frac{V^2}R',
      moreInfoCorrectEq: [  'P \\text{: power}',
        'V \\text{: voltage}','R \\text{: resistance}'
      ],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, lineRight: true, textRB1:'R'),
      moreInfoQ: ['R \\text{: resistance}'
      ],
      option1: 'V^2', option1Meaning: 'square of voltage',
      option2: 'P', option2Meaning: 'power',
      option3: 'I^2', option3Meaning: 'square of current',
      option4: 'V', option4Meaning: 'voltage',
      correctAnswer1: 'V^2',
      correctAnswer2: 'P'
  ),//E12
  FormulaQuizQuestionSet(
      id: 'E13',

      description: 'Root-mean-square voltage',
      correctEquation: 'V_{rms}=\\frac{V_0}{\\sqrt2}',
      moreInfoCorrectEq: [  'V_{rms} \\text{: root-mean-square voltage}',
        '{V_0} \\text{: peak voltage}'      ],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, lineRight: true, textRB1:'\\sqrt2'),
      moreInfoQ: [ ],
      option1: 'V^2', option1Meaning: 'square of voltage',
      option2: 'V_{rms}', option2Meaning: 'root-mean-square voltage',
      option3: 'V_{min}', option3Meaning: 'minimum voltage',
      option4: 'V_o', option4Meaning: 'peak voltage',
      correctAnswer1: 'V_o',
      correctAnswer2: 'V_{rms}'
  ),//E13
  FormulaQuizQuestionSet(
      id: 'E14',

      description: 'Root-mean-square current',
      correctEquation: 'I_{rms}=\\frac{I_0}{\\sqrt2}',
      moreInfoCorrectEq: [  'I_{rms} \\text{: root-mean-square current}',
        '{I_0} \\text{: peak current}'      ],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, lineRight: true, textRB1:'\\sqrt2'),
      moreInfoQ: [],
      option1: 'I^2', option1Meaning: 'square of current',
      option2: 'I_{rms}', option2Meaning: 'root-mean-square current',
      option3: 'I_{min}', option3Meaning: 'minimum current',
      option4: 'I_o', option4Meaning: 'peak current',
      correctAnswer1: 'I_o',
      correctAnswer2: 'I_{rms}'
  ),//E14
];

List<FormulaQuizQuestionSet> electromagnetism = [
  FormulaQuizQuestionSet(
      id: 'E15',

      description: 'Magnetic field due to a long straight wire',
      correctEquation: 'B = \\frac {\\mu_o I} {2\\pi r}',
      moreInfoCorrectEq: [  'B \\text{: magnetic field}',
        '{\\mu_o} \\text{: permeability of free space}', 'I \\text{: current}', 'r \\text{: perpendicular distance from wire}'      ],
      equationQ: ReusableEquation(boxLT: true, textRT1: '\\mu_o', boxRT: true, lineRight: true, textRB1:'2\\pi r'),
      moreInfoQ: [  'B \\text{: magnetic field}',
        '{\\mu_o} \\text{: permeability of free space}','r \\text{: perpendicular distance from wire}'      ],
      option1: 'Q', option1Meaning: 'charge',
      option2: 'B', option2Meaning: 'magnetic field',
      option3: 'E', option3Meaning: 'energy',
      option4: 'I', option4Meaning: 'current',
      correctAnswer1: 'I',
      correctAnswer2: 'B'
  ),//E15
  FormulaQuizQuestionSet(
      id: 'E16',
      description: 'Magnetic field inside a long solenoid',
      correctEquation: 'B = \\frac {\\mu_0 NI} {l}',
      moreInfoCorrectEq: [  'B \\text{: magnetic field}',
        '{\\mu_o} \\text{: permeability of free space}',  'N \\text{: no. of turns of solenoid}'
            'I \\text{: current}', 'l \\text{: length of solenoid}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: '\\mu_o', boxRT: true,
          textRT2: 'I', lineRight: true, textRB1:'l'),
      moreInfoQ: [
        '{\\mu_o} \\text{: permeability of free space}',  'I \\text{: current}', 'l \\text{: length of solenoid}'],
      option1: 'n', option1Meaning: 'turn ratio of solenoid',
      option2: 'B', option2Meaning: 'magnetic field inside solenoid',
      option3: 'E', option3Meaning: 'energy',
      option4: 'N', option4Meaning: 'no. of turns of solenoid',
      correctAnswer1: 'N',
      correctAnswer2: 'B'
  ),//E16
  FormulaQuizQuestionSet(
      id: 'E17',
      description: 'Force on a current-carrying conductor in a magnetic field',
      correctEquation: 'F=BIL \\sin\\theta',
      moreInfoCorrectEq: [  'F \\text{: magnetic force}',
        'B \\text{: magnetic field}',  'I \\text{: current}', 'L \\text{: length of conductor in B-field}',
      '\\theta \\text{: angle between current and B-field}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'BI', boxRT: true,
          textRT2: '\\sin\\theta'),
      moreInfoQ: [ 'B \\text{: magnetic field}',  'I \\text{: current}',
        '\\theta \\text{: angle between current and B-field}'],
      option1: 'v', option1Meaning: 'velocity',
      option2: 'L', option2Meaning: 'length of conductor in B-field',
      option3: 'E', option3Meaning: 'energy',
      option4: 'F', option4Meaning: 'magnetic force',
      correctAnswer1: 'L',
      correctAnswer2: 'F'
  ),//E17
  FormulaQuizQuestionSet(
      id: 'E18',
      description: 'Force between two parallel current-carrying wires',
      correctEquation: '\\frac FL = \\frac {\\mu_0 I_1 I_2} {2\\pi r}',
      moreInfoCorrectEq: [  'F \\text{: magnetic force}','L \\text{: length of wire}',
              '{\\mu_o} \\text{: permeability of free space}', 'I_1 \\text{: current of wire 1}',
        'I_2 \\text{: current of wire 2}', 'r \\text{: separation between 2 wires}'],
      equationQ: ReusableEquation(textLT1: 'F', lineLeft: true, boxLB: true,
          textRT1: '\\mu_0 I_1 I_2', lineRight: true, boxRB: true),
      moreInfoQ: [  'F \\text{: magnetic force}',
        '{\\mu_o} \\text{: permeability of free space}', 'I_1 \\text{: current of wire 1}',
        'I_2 \\text{: current of wire 2}'],
      option1: '2\\pi r^2', option1Meaning: 'r is separation between 2 wires',
      option2: 'L', option2Meaning: 'length of conductor',
      option3: 'E', option3Meaning: 'energy',
      option4: '2\\pi r', option4Meaning: 'r is separation between 2 wires',
      correctAnswer1: '2\\pi r',
      correctAnswer2: 'L'
  ),//E18
  FormulaQuizQuestionSet(
      id: 'E19',
      description: 'Torque for current-carrying coil in a magnetic field',
      correctEquation: '\\tau = NIBA \\sin\\theta',
      moreInfoCorrectEq: [  '\\tau \\text{: moment of coil}','N \\text{: no. of turns of coil}',
        'I \\text{: current}',
        'B \\text{: magnetic field strength}', 'A \\text{: area of coi}',
      '\\theta \\text{: angular displacement of coil}'],
      equationQ: ReusableEquation(boxLT: true, textRT2: 'IBA\\sin\\theta', boxRT: true),
      moreInfoQ: [
        'I \\text{: current}',
        'B \\text{: magnetic field strength}', 'A \\text{: area of coi}',
        '\\theta \\text{: angular displacement of coil}'],
      option1: 'N', option1Meaning: 'no. of turns of coil',
      option2: 'V', option2Meaning: 'voltage',
      option3: '\\tau', option3Meaning: 'moment of coil',
      option4: '\\theta', option4Meaning: 'angular displacement of coil',
      correctAnswer1: 'N',
      correctAnswer2: '\\tau'
  ),//E19
  FormulaQuizQuestionSet(
      id: 'E20',
      description: 'Force on a moving charge in a magnetic field',
      correctEquation: 'F = Bvq \\sin\\theta',
      moreInfoCorrectEq: [  'F \\text{: magnetic force on moving charge}','B \\text{: magnetic field strength}',
        'v \\text{: velocity of moving charge}',
        'q \\text{: charge of moving charge}',
        '\\begin{array}{c} \\theta \\text{: angle between velocity of} \\\\ \\text{moving charge and magnetic field} \\end{array}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'Bv', boxRT: true, textRT2: '\\sin\\theta',),
      moreInfoQ: ['B \\text{: magnetic field strength}',
        'v \\text{: velocity of moving charge}',
        '\\begin{array}{c} \\theta \\text{: angle between velocity of} \\\\ \\text{moving charge and magnetic field} \\end{array}'],
      option1: 'F', option1Meaning: 'magnetic force on moving charge',
      option2: 'V', option2Meaning: 'voltage',
      option3: 'q', option3Meaning: 'charge of moving charge',
      option4: 'm', option4Meaning: 'mass of moving charge',
      correctAnswer1: 'q',
      correctAnswer2: 'F'
  ),//E20
  FormulaQuizQuestionSet(
      id: 'E21',
      description: 'Radius of the circular path of a moving charge in a magnetic field',
      correctEquation: 'r = \\frac {mv} {Bq}',
      moreInfoCorrectEq: [  'r \\text{: radius of circular path}','m \\text{: mass of moving charge}',
        'v \\text{: velocity of moving charge}',
        'B \\text{: magnetic field}',
        'q \\text{: charge of moving charge}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'm', boxRT: true,
        lineRight: true, textRB1: 'Bq',),
      moreInfoQ: [  'm \\text{: mass of moving charge}',
      'B \\text{: magnetic field}',
        'q \\text{: charge of moving charge}'],
      option1: 'F', option1Meaning: 'magnetic force on moving charge',
      option2: 'V', option2Meaning: 'voltage',
      option3: 'v', option3Meaning: 'linear velocity of moving charge',
      option4: 'r', option4Meaning: 'radius of circular path',
      correctAnswer1: 'v',
      correctAnswer2: 'r'
  ),//E21
];

List<FormulaQuizQuestionSet> electInduction = [
  FormulaQuizQuestionSet(
      id: 'E22',
      description: 'Electromagnetic flux',
      correctEquation: '\\phi =BA',
      moreInfoCorrectEq: [  '\\phi \\text{: electromagnetic flux}',
        'B \\text{: magnetic field}',
        'A \\text{: Area perpendicular to B-field}'],
      equationQ: ReusableEquation(boxLT: true, boxRT: true, textRT2: 'A',),
      moreInfoQ: [
        'A \\text{: area perpendicular to B-field}'],
      option1: '\\phi', option1Meaning: 'electromagnetic flux',
      option2: 'V', option2Meaning: 'voltage',
      option3: 'q', option3Meaning: 'charge of moving charge',
      option4: 'B', option4Meaning: 'magnetic field',
      correctAnswer1: 'B',
      correctAnswer2: '\\phi'
  ),//E22
  FormulaQuizQuestionSet(
      id: 'E23',
      description: 'Induced Emf',
      correctEquation: '\\varepsilon = \\frac {\\Delta NBA} {\\Delta t}',
      moreInfoCorrectEq: [  '\\varepsilon \\text{: induced emf}',
        'N \\text{: no. of turns of coil}',
        'B \\text{: magnetic field}',
        'A \\text{: area perpendicular to B-field}',
        't \\text{: time}'
      ],
      equationQ: ReusableEquation(boxLT: true, textRT1: '\\Delta N', boxRT: true, textRT2: 'A', lineRight: true, textRB1: '\\Delta t',),
      moreInfoQ: [
        'N \\text{: no. of turns of coil}',
        'A \\text{: area perpendicular to B-field}',
        't \\text{: time}'],
      option1: '\\phi', option1Meaning: 'electromagnetic flux',
      option2: 'I', option2Meaning: 'induced current',
      option3: '\\varepsilon', option3Meaning: 'induced emf',
      option4: 'B', option4Meaning: 'magnetic field',
      correctAnswer1: 'B',
      correctAnswer2: '\\varepsilon'
  ),//E23
  FormulaQuizQuestionSet(
      id: 'E24',

      description: 'Induced emf of a moving rod in magnetic field',
      correctEquation: '\\varepsilon = Bvl',
      moreInfoCorrectEq: [  '\\varepsilon \\text{: induced emf}',
        'B \\text{: magnetic field}',
        'v \\text{: velocity of moving rod}',
        'l \\text{: length of rod in magnetic field}'
      ],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'B', boxRT: true, textRT2: 'l'),
      moreInfoQ: [
        'B \\text{: magnetic field}',
        'l \\text{: length of rod in magnetic field}'
      ],
      option1: 'm', option1Meaning: 'mass of moving rod',
      option2: 'v', option2Meaning: 'velocity of moving rod',
      option3: '\\varepsilon', option3Meaning: 'induced emf',
      option4: 'F', option4Meaning: 'magnetic force',
      correctAnswer1: 'v',
      correctAnswer2: '\\varepsilon'
  ),//E24
  FormulaQuizQuestionSet(
    id: 'E25',

    description: 'Ratio of secondary voltage to primary voltage in a transformer',
    correctEquation: '\\frac {V_p} {V_s} = \\frac {N_p} {N_s}',
    moreInfoCorrectEq: [  'V_p \\text{: voltage in primary coil}',
      'V_s \\text{: voltage in secondary coil}',
      'N_p \\text{: no. of turns of primary coil}',
      'N_s \\text{: no. of turns of secondary coil}'
    ],
    equationQ: ReusableEquation(textLT1: '\\frac {V_p} {V_s}',  boxRT: true),
    moreInfoQ: [  'V_p \\text{: voltage in primary coil}',
      'V_s \\text{: voltage in secondary coil}',
    ],
    option1: '\\frac {N_p} {N_s}', option1Meaning: 'no. of turns of primary to secondary coil',
    option2: '\\frac {N_s} {N_p}', option2Meaning: 'no. of turns of secondary to primary coil',
    option3: '{N_s}', option3Meaning: 'no. of turns of secondary coil',
    option4: '{N_p}', option4Meaning: 'no. of turns of primary coil',
    correctAnswer1: '\\frac {N_p} {N_s}',
    // correctAnswer2: '\\varepsilon'
  ),//E25
];

List<FormulaQuizQuestionSet> radioactivity = [
  FormulaQuizQuestionSet(
      id: 'R1',

      description: 'Activity of radioactive substance',
    correctEquation: 'A = \\frac nt',
      moreInfoCorrectEq: [  'A \\text{: activity of radioactive substance}',
        'n \\text{:  no. of decay}',
        't \\text{: time}'],
    equationQ: ReusableEquation(boxLT: true, textRB1: 't', lineRight: true, boxRT: true),
      moreInfoQ: [
        't \\text{: time}'],
    option1: 'N', option1Meaning: 'no. of undecayed nuclei',
    option2: 'n', option2Meaning: 'no. of decay',
    option3: 'E', option3Meaning: 'energy of 1 decay',
    option4: 'A', option4Meaning: 'activity',
    correctAnswer1: 'n',
    correctAnswer2: 'A'
  ),//R1
  FormulaQuizQuestionSet(
      id: 'R2',

      description: 'Activity and the number of undecayed nuclei',
      correctEquation: 'A = kN',
      moreInfoCorrectEq: [  'A \\text{: activity of radioactive substance}',
        'k \\text{:  decay constant}',
        'N \\text{: no. of undecayed nuclei}'],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'k', boxRT: true),
      moreInfoQ: [
        'k \\text{:  decay constant}',
        ],
      option1: 'N', option1Meaning: 'no. of undecayed nuclei',
      option2: 'n', option2Meaning: 'no. of decay',
      option3: 'E', option3Meaning: 'energy of 1 decay',
      option4: 'A', option4Meaning: 'activity',
      correctAnswer1: 'N',
      correctAnswer2: 'A'
  ),//R2
  FormulaQuizQuestionSet(
      id: 'R3',

      description: 'Half-life and decay constant',
      correctEquation: 't_{\\frac 12}=\\frac{ln2}{k}',
      moreInfoCorrectEq: [  't_{\\frac 12} \\text{: half-life}',
        'k \\text{: decay constant}',
        ],
      equationQ: ReusableEquation(boxLT: true, textRB1: 'k',lineRight: true, boxRT: true),
      moreInfoQ: [
        'k \\text{: decay constant}',
      ],
      option1: 'ln10', option1Meaning: 'natural log 10',
      option2: 'ln2', option2Meaning: 'natural log 2',
      option3: 't_{\\frac 12}', option3Meaning: 'half-life',
      option4: 'A', option4Meaning: 'activity',
      correctAnswer1: 'ln2',
      correctAnswer2: 't_{\\frac 12}'
  ),//R3
  FormulaQuizQuestionSet(
      id: 'R4',

      description: 'Exponential Law of decay',
      correctEquation: 'A = A_o e^{-kt}',
      moreInfoCorrectEq: [  'A \\text{: activity after time t}',
        'A_o \\text{: initial activity} ',
        'e \\text{: natural exponent}',
        'k \\text{: decay constant}',
        't \\text{: time}'
      ],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'A_o', boxRT: true, textRT2: '^{-kt}',),
      moreInfoQ: [
        'A_o \\text{: initial activity} ',
            'k \\text{: decay constant}',
        't \\text{: time}'
      ],
      option1: 'e', option1Meaning: 'natural exponent',
      option2: 'ln2', option2Meaning: 'natural log 2',
      option3: 't_{\\frac 12}', option3Meaning: 'half-life',
      option4: 'A', option4Meaning: 'activity after time t',
      correctAnswer1: 'e',
      correctAnswer2: 'A'
  ),//R4
  FormulaQuizQuestionSet(
      id: 'R5',

      description: 'Mass-energy relationship',
      correctEquation: 'E = mc^2',
      moreInfoCorrectEq: [  'E \\text{: energy}',
        'm \\text{: mass} ',
        'c \\text{: speed of light in vacuum}',
      ],
      equationQ: ReusableEquation(boxLT: true, textRT1: 'm', boxRT: true),
      moreInfoQ: [  'm \\text{: mass} '],
      option1: 'c', option1Meaning: 'speed of light in vacuum',
      option2: 'c^2', option2Meaning: 'square of speed of light in vacuum',
      option3: 'P', option3Meaning: 'power',
      option4: 'E', option4Meaning: 'energy',
      correctAnswer1: 'c^2',
      correctAnswer2: 'E'
  ),//R5
];



