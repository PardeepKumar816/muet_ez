class DummyData {
  static Map<String, dynamic> paidChallanData = {
    'university': [
      {
        'description': '1st Semester',
        'feeAmount': '38000',
        'lateFees': '500',
        'TotalDue': '38500',
        'remaining': '0',
      },
      {
        'description': '2nd Semester',
        'feeAmount': '15000',
        'lateFees': '500',
        'TotalDue': '15500',
        'remaining': '0',
      },
      {
        'description': '3rd Semester',
        'feeAmount': '20000',
        'lateFees': '300',
        'TotalDue': '20300',
        'remaining': '0',
      },
      {
        'description': '4th Semester',
        'feeAmount': '15000',
        'lateFees': '500',
        'TotalDue': '15500',
        'remaining': '0',
      },
      {
        'description': '5th Semester',
        'feeAmount': '21000',
        'lateFees': '100',
        'TotalDue': '21100',
        'remaining': '0',
      },
    ],
    'hostel': [
      {
        'description': '1st Semester',
        'feeAmount': '8000',
        'lateFees': '500',
        'TotalDue': '8500',
        'remaining': '0',
      },
      {
        'description': '2nd Semester',
        'feeAmount': '9000',
        'lateFees': '500',
        'TotalDue': '9500',
        'remaining': '0',
      },
      {
        'description': '3rd Semester',
        'feeAmount': '9500',
        'lateFees': '0',
        'TotalDue': '9500',
        'remaining': '0',
      },
      {
        'description': '4th Semester',
        'feeAmount': '7500',
        'lateFees': '500',
        'TotalDue': '8000',
        'remaining': '0',
      },
      {
        'description': '5th Semester',
        'feeAmount': '9000',
        'lateFees': '100',
        'TotalDue': '9100',
        'remaining': '0',
      },
    ],
    'others': [
      {
        'description': 'Fine',
        'feeAmount': '1000',
        'lateFees': '0',
        'TotalDue': '1000',
        'remaining': '0',
      },
      {
        'description': 'Fine',
        'feeAmount': '2000',
        'lateFees': '0',
        'TotalDue': '2000',
        'remaining': '0',
      },
    ],
  };

  static Map<String, dynamic> unpaidChallanData = {
    'university': [
      {
        'description': '6th Semester',
        'feeAmount': '25000',
        'lateFees': '1200',
        'TotalDue': '26200',
        'remaining': '26200',
      },
    ],
    'hostel': [
      {
        'description': '5th Semester',
        'feeAmount': '8000',
        'lateFees': '500',
        'TotalDue': '8500',
        'remaining': '8500',
      },
      {
        'description': '6th Semester',
        'feeAmount': '9000',
        'lateFees': '500',
        'TotalDue': '9500',
        'remaining': '9500',
      },
    ],
    'others': [
      {
        'description': 'Fine',
        'feeAmount': '1000',
        'lateFees': '200',
        'TotalDue': '1200',
        'remaining': '1200',
      },
      {
        'description': 'Fine',
        'feeAmount': '2000',
        'lateFees': '300',
        'TotalDue': '2300',
        'remaining': '0',
      },
    ],
  };

  static Map<String, dynamic> timeTable = {
    'Mon': ['MC (PR)', 'MC (PR)', 'MC (PR)', 'MC', 'WE', 'SERE*', ''],
    'Tue': ['FMSE', 'MC', 'SERE', 'WE', 'WE (PR)*', 'WE (PR)*', 'WE (PR)*'],
    'Wed': [
      'WE (PR)',
      'WE (PR)',
      'WE (PR)',
      'SERE',
      'THESIS',
      'THESIS',
      'THESIS'
    ],
    'Thu': ['WE', 'FMSE', 'SERE', 'WE*', 'WE (PR)*', 'WE (PR)*', 'WE (PR)*'],
    'Fri': ['MC*', 'FMSE', 'MC', 'FMSE*', 'CAREER COUNSELING', '', ''],
  };

  static Map<String, dynamic> examinationScheduleMids = {
    'date': [
      '13-02-2023 (Monday)',
      '14-02-2023 (Tuesday)',
      '15-02-2023 (Wednesday)',
      '16-02-2023 (Friday)',
    ],
    'time': [
      '12 PM',
      '12 PM',
      '12 PM',
      '12 PM',
    ],
    'subject': [
      'Multimedia Communication',
      'Formal Methods of Software Engineering',
      'Software Re-Engineering',
      'Web Engineering'
    ],
  };

  static List<String> departmentList = [
    'Software Engineering',
    'Civil Engineering',
    'Mechanical Engineering',
    'Electrical Engineering',
    'Mining Engineering',
    'Computer System Engineering',
    'Industrial Engineering',
    'Chemical Engineering',
    'Petroleum & Gas Engineering',
    'Electronics Engineering',
    'City & Regional Planning Engineering',
    'Textile Engineering',
    'Biomedical Engineering',
    'Telecommunication Engineering',
  ];

  static List<String> classList = [
    'Class 22sw-I - Semester 1',
    'Class 22sw-II - Semester 1',
    'Class 22sw-III - Semester 1',
    'Class 21sw-I - Semester 3',
    'Class 21sw-II - Semester 3',
    'Class 21sw-III - Semester 3',
    'Class 20sw-I - Semester 5',
    'Class 20sw-II - Semester 5',
    'Class 19sw-I - Semester 7',
    'Class 19sw-II - Semester 7',
  ];

  static List<String> semester = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  static Map<String, dynamic> result = {
    "First Semester": {
      "Calculus": {
        "theory": {
          "marks obtained": "91",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        }
      },
      "Programming Fundamental": {
        "theory": {
          "marks obtained": "86",
          "credit hours": "3",
          "grades": "A",
          "quality points": "6.00",
        },
        "practical": {
          "marks obtained": "44",
          "credit hours": "2",
          "grades": "A",
          "quality points": "6.00",
        }
      },
      "Introduction to Information & Communication Technology": {
        "theory": {
          "marks obtained": "46",
          "credit hours": "2",
          "grades": "A+",
          "quality points": "6.00",
        },
        "practical": {
          "marks obtained": "44",
          "credit hours": "2",
          "grades": "A",
          "quality points": "6.00",
        }
      },
      "Functional English": {
        "theory": {
          "marks obtained": "83",
          "credit hours": "3",
          "grades": "B+",
          "quality points": "4.00",
        }
      },
      "Applied Physics": {
        "theory": {
          "marks obtained": "70",
          "credit hours": "3",
          "grades": "B",
          "quality points": "2.00",
        }
      },
    },
    "Second Semester": {
      "Introduction to Software Engineering": {
        "theory": {
          "marks obtained": "91",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        }
      },
      "Professional Practices": {
        "theory": {
          "marks obtained": "91",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        }
      },
      "Object Oriented Programming": {
        "theory": {
          "marks obtained": "86",
          "credit hours": "3",
          "grades": "A",
          "quality points": "6.00",
        },
        "practical": {
          "marks obtained": "48",
          "credit hours": "2",
          "grades": "A+",
          "quality points": "6.00",
        },
      },
      "Pakistan Study": {
        "theory": {
          "marks obtained": "40",
          "credit hours": "2",
          "grades": "B+",
          "quality points": "6.00",
        },

      },
      "Ethics": {
        "theory": {
          "marks obtained": "40",
          "credit hours": "2",
          "grades": "B+",
          "quality points": "6.00",
        },

      },
      "Linear Algebra & Analytical Geometry": {
        "theory": {
          "marks obtained": "94",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        },

      },
    },
    "Third Semester": {
      "Introduction to Software Engineering": {
        "theory": {
          "marks obtained": "91",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        }
      },
      "Professional Practices": {
        "theory": {
          "marks obtained": "91",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        }
      },
      "Object Oriented Programming": {
        "theory": {
          "marks obtained": "86",
          "credit hours": "3",
          "grades": "A",
          "quality points": "6.00",
        },
        "practical": {
          "marks obtained": "48",
          "credit hours": "2",
          "grades": "A+",
          "quality points": "6.00",
        },
      },
      "Pakistan Study": {
        "theory": {
          "marks obtained": "40",
          "credit hours": "2",
          "grades": "B+",
          "quality points": "6.00",
        },

      },
      "Ethics": {
        "theory": {
          "marks obtained": "40",
          "credit hours": "2",
          "grades": "B+",
          "quality points": "6.00",
        },

      },
      "Linear Algebra & Analytical Geometry": {
        "theory": {
          "marks obtained": "94",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        },

      },
    },
    "Fourth Semester": {
      "Introduction to Software Engineering": {
        "theory": {
          "marks obtained": "91",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        }
      },
      "Professional Practices": {
        "theory": {
          "marks obtained": "91",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        }
      },
      "Object Oriented Programming": {
        "theory": {
          "marks obtained": "86",
          "credit hours": "3",
          "grades": "A",
          "quality points": "6.00",
        },
        "practical": {
          "marks obtained": "48",
          "credit hours": "2",
          "grades": "A+",
          "quality points": "6.00",
        },
      },
      "Pakistan Study": {
        "theory": {
          "marks obtained": "40",
          "credit hours": "2",
          "grades": "B+",
          "quality points": "6.00",
        },

      },
      "Ethics": {
        "theory": {
          "marks obtained": "40",
          "credit hours": "2",
          "grades": "B+",
          "quality points": "6.00",
        },

      },
      "Linear Algebra & Analytical Geometry": {
        "theory": {
          "marks obtained": "94",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        },

      },
    },
    "Fifth Semester": {
      "Introduction to Software Engineering": {
        "theory": {
          "marks obtained": "91",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        }
      },
      "Professional Practices": {
        "theory": {
          "marks obtained": "91",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        }
      },
      "Object Oriented Programming": {
        "theory": {
          "marks obtained": "86",
          "credit hours": "3",
          "grades": "A",
          "quality points": "6.00",
        },
        "practical": {
          "marks obtained": "48",
          "credit hours": "2",
          "grades": "A+",
          "quality points": "6.00",
        },
      },
      "Pakistan Study": {
        "theory": {
          "marks obtained": "40",
          "credit hours": "2",
          "grades": "B+",
          "quality points": "6.00",
        },

      },
      "Ethics": {
        "theory": {
          "marks obtained": "40",
          "credit hours": "2",
          "grades": "B+",
          "quality points": "6.00",
        },

      },
      "Linear Algebra & Analytical Geometry": {
        "theory": {
          "marks obtained": "94",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        },

      },
    },
    "Sixth Semester": {
      "Introduction to Software Engineering": {
        "theory": {
          "marks obtained": "91",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        }
      },
      "Professional Practices": {
        "theory": {
          "marks obtained": "91",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        }
      },
      "Object Oriented Programming": {
        "theory": {
          "marks obtained": "86",
          "credit hours": "3",
          "grades": "A",
          "quality points": "6.00",
        },
        "practical": {
          "marks obtained": "48",
          "credit hours": "2",
          "grades": "A+",
          "quality points": "6.00",
        },
      },
      "Pakistan Study": {
        "theory": {
          "marks obtained": "40",
          "credit hours": "2",
          "grades": "B+",
          "quality points": "6.00",
        },

      },
      "Ethics": {
        "theory": {
          "marks obtained": "40",
          "credit hours": "2",
          "grades": "B+",
          "quality points": "6.00",
        },

      },
      "Linear Algebra & Analytical Geometry": {
        "theory": {
          "marks obtained": "94",
          "credit hours": "3",
          "grades": "A+",
          "quality points": "6.00",
        },

      },
    },

  };

  static List<String> notification = [
    'Announcement for Admit Cards to Masters and PhD Candidates	27/01/2023 - 11:57am',
    'The 2nd COT List of Merit Candidates of 22-Batch	09/01/2023 - 8:35pm',
    'Admissions for PhD & Master Programs Deadline Extended till 10 Jan 2023	06/01/2023 - 7:49pm',
    'First List of the Self-Financing Candidates Whose Disciplines have been Changed as per their given Choices	06/01/2023 - 11:37am',
    'Announcement Regarding Leftover Seats	05/01/2023 - 11:42am',
    'Interview for Appointment to the Post of Lecturer (on Contract basis) Department of BSRS	23/11/2022 - 12:28pm',
    'Notification regarding Rejection of the Documents of Candidates	06/09/2022 - 4:40pm',
    'Notification for the extension of Last date of Registration	05/08/2022 - 8:23pm',
    'Date of Online Registration for Admission Extended Till 29 July 2022	20/07/2022 - 9:31pm',
    'Get Ready for Undergraduate Admissions Session 2022-23	29/06/2022 - 8:57pm',
    'Provisional End Semester Attendance Reports: 21-batch 3rd Semester and 22-batch 1st Semester Masters and PhD courses	16/06/2022 - 2:36pm',
    'Notification Regarding Registration of 09 to14 Batches	12/05/2022 - 1:36pm',
  ];
  static List<String> events = [
    'Admissions Open for PhD & Master Programs - Spring 2023	17/12/2022 - 11:23am',
    'Report on training on OBE Implementation	06/03/2023 - 3:52pm',
    'Seminar on "Deep Learning"	06/03/2023 - 3:47pm',
    'Lecturer and Research Assistant (Contract Basis) at Mining Engineering Department	06/03/2023 - 3:42pm',
    'Faculty Position on Contract Basis at Department of Architecture	06/03/2023 - 3:38pm',
    'MUTA- Need Cum Merit SCHOLARSHIP 2023	18/02/2023 - 4:02am',
    'Position Vacant for Lecturer (On Contract) at Department of Mechatronic Engineering	10/02/2023 - 5:23pm',
    'Research Assistant Positions (On Contract Basis) at Department of Mechanical Engineering	08/02/2023 - 9:09pm',
    'MUET Jamshoro team secured a grant of \$9800 in EPICS in the IEEE, Access and Abilities category	06/02/2023 - 2:35pm',
    'Faculty Position in Centre of English Language and Linguistics	01/02/2023 - 3:20pm',
    'Faculty Positions (Lecturer Maths. & English) SZAB Campus Khairpur Mir\'s	31/01/2023 - 1:36pm',
    'Result of the PG Admissions Test held on 28-01-2023	30/01/2023 - 4:38pm',
    'Faculty Position at IEEM, Mehran UET, Jamshoro	30/01/2023 - 2:07pm',
    'Pre-Admission Test Result (Phase-3) - 24-01-2023	24/01/2023 - 3:55pm',
    '3rd COT List of Merit & Self-Finance Candidates of 22-Batch	21/01/2023 - 2:30am',
  ];
  static Map<String,dynamic> dinning = {
    'Hill Top Canteen':{
      'address':'Department of Mining Engineering',
      'time':'7:00 AM to 3:00 PM',
      'meals':['Breakfast','Lunch','Dinner'],
      'restaurant dinning':['Indoor','Outdoor'],
      'breakfast':[
        'Omelet',
        'half fry',
        'Aanda Qeema',
        'Aloo Chips',
        'Tea',
        'Paratha',
      ],
      'lunch':[
        'Biryani',
        'Bhindi',
        'Choola',
        'Mix Sabzi',
      ],
      'dinner':[],
      'image':['assets/images/canteen.jpg','assets/images/canteen.jpg'],
    },
    'Electronic Canteen':{
      'address':'Department of Mining Engineering',
      'time':'7:00 AM to 3:00 PM',
      'meals':['Breakfast','Lunch','Dinner'],
      'restaurant dinning':['Indoor','Outdoor'],
      'breakfast':[
        'Omelet',
        'half fry',
        'Aanda Qeema',
        'Aloo Chips',
        'Tea',
        'Paratha',
      ],
      'lunch':[
        'Biryani',
        'Bhindi',
        'Choola',
        'Mix Sabzi',
      ],
      'dinner':[],
      'image':['assets/images/canteen.jpg','assets/images/canteen.jpg'],
    },
    'IT Canteen':{
      'address':'Department of Mining Engineering',
      'time':'7:00 AM to 3:00 PM',
      'meals':['Breakfast','Lunch','Dinner'],
      'restaurant dinning':['Indoor','Outdoor'],
      'breakfast':[
        'Omelet',
        'half fry',
        'Aanda Qeema',
        'Aloo Chips',
        'Tea',
        'Paratha',
      ],
      'lunch':[
        'Biryani',
        'Bhindi',
        'Choola',
        'Mix Sabzi',
      ],
      'dinner':[],
      'image':['assets/images/canteen.jpg','assets/images/canteen.jpg'],
    },
    'CC Canteen':{
      'address':'Department of Mining Engineering',
      'time':'7:00 AM to 3:00 PM',
      'meals':['Breakfast','Lunch','Dinner'],
      'restaurant dinning':['Indoor','Outdoor'],
      'breakfast':[
        'Omelet',
        'half fry',
        'Aanda Qeema',
        'Aloo Chips',
        'Tea',
        'Paratha',
      ],
      'lunch':[
        'Biryani',
        'Bhindi',
        'Choola',
        'Mix Sabzi',
      ],
      'dinner':[],
      'image':['assets/images/canteen.jpg','assets/images/canteen.jpg'],
    },
    'STC Canteen':{
      'address':'Department of Mining Engineering',
      'time':'7:00 AM to 3:00 PM',
      'meals':['Breakfast','Lunch','Dinner'],
      'restaurant dinning':['Indoor','Outdoor'],
      'breakfast':[
        'Omelet',
        'half fry',
        'Aanda Qeema',
        'Aloo Chips',
        'Tea',
        'Paratha',
      ],
      'lunch':[
        'Biryani',
        'Bhindi',
        'Choola',
        'Mix Sabzi',
      ],
      'dinner':[],
      'image':['assets/images/canteen.jpg','assets/images/canteen.jpg'],
    },
  };

  static Map<String,dynamic> transport = {
    '27':{
      'Morning: 6:00 AM':'Auto Bhan - Gudu Chowk - Ali Palace',
      'Noon: 3:00 PM (12PM Firday)':'Ali Palace - Gudu Chowk - Auto Bhan Road - Latifibad No. 7',
      'Evening: 5:00 PM':'Wadhu Wah - Qasim Chowk - Gul Center',
      'Night: 8:00 PM':'Gul Center - Qasim Chowk - Abdullah City - Main Gate - CC - Sachal Hostel - Grils Hostel',
    },
    '37':{
      'Morning: 6:00 AM':'Auto Bhan - Gudu Chowk - Ali Palace',
      'Noon: 3:00 PM (12PM Firday)':'Ali Palace - Gudu Chowk - Auto Bhan Road - Latifibad No. 7',
      'Evening: 5:00 PM':'Wadhu Wah - Qasim Chowk - Gul Center',
      'Night: 8:00 PM':'Gul Center - Qasim Chowk - Abdullah City - Main Gate - CC - Sachal Hostel - Grils Hostel',
    },
  };

}
