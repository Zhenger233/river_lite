query_answer(String q) {
  print("查询：${q}");
  for (var i = 0; i < river_answer.length; i++) {
    Map tmp = river_answer[i];
    if (q.contains(tmp["q"].toString())) {
      return tmp["a"];
    }
  }
}

List<Map> river_answer = [
  {
    "q": "“橘生淮南则为橘，生为淮北则为枳，叶徒相似，其实味不同。所以然者何?水土异也。”橘逾淮为枳说明了",
    "a": "事物的发展变化以时间地点和条件为转移",
  },
  {
    "q": "_____ some old tables, his house was almost empty.",
    "a": "Apart from",
  },
  {
    "q": "“成电”是哪所学校的简称？",
    "a": "成都电讯工程学院",
  },
  {
    "q": "“三长两短”与下列哪个选项有关",
    "a": "棺材",
  },
  {
    "q": "“新郎官”最早用来指",
    "a": "新科进士",
  },
  {
    "q": "《春夜喜雨》是杜甫在哪里创作的作品",
    "a": "成都",
  },
  {
    "q": "《全唐诗》是哪个时期的作品",
    "a": "清朝",
  },
  {
    "q": "192.168.1.1是__类地址",
    "a": "C",
  },
  {
    "q": "1956年，成都电讯工程学院（现“电子科技大学”）不是由以下哪座大学中的电讯工程专业组建的？",
    "a": "四川大学（现四川大学）",
  },
  {
    "q": "2016年是电子科技大学多少周年校庆",
    "a": "60",
  },
  {
    "q": "30名学生平均分为85（百分制），不及格（60分以下）的人最多有几个",
    "a": "10",
  },
  {
    "q":
        "How do you like the film?   ---There was nothing special--- it was only ____",
    "a": "average",
  },
  {
    "q":
        "Now in the market there are too many oranges, making the prices down, so I suggest",
    "a": "you turning to doing other business",
  },
  {
    "q": "按照年龄排序最年轻的是",
    "a": "季",
  },
  {
    "q": "被称为“万园之园”的是指",
    "a": "圆明园",
  },
  {
    "q": "大施特劳斯和小施特劳斯的关系是",
    "a": "父子",
  },
  {
    "q": "但愿人长久，千里共婵娟是哪位作家的作品",
    "a": "苏轼",
  },
  {
    "q": "地壳中含量最多的金属元素是",
    "a": "铝元素",
  },
  {
    "q": "帝王的镜子指的是",
    "a": "资治通鉴",
  },
  {
    "q": "电子科技大学硕士生每月补助多少（纯数字）",
    "a": "500",
  },
  {
    "q": "都江堰修建于哪个朝代",
    "a": "战国",
  },
  {
    "q": "对应错误的是",
    "a": "电流－伏特",
  },
  {
    "q": "二十四节气中最能代表春、夏、秋、冬四个季节到来的节气是",
    "a": "春分、夏至、秋分、冬至",
  },
  {
    "q": "父亲和儿子血型都是A，母亲血型有几种可能",
    "a": "4",
  },
  {
    "q": "感冒忌用下列哪一种食物",
    "a": "海鱼",
  },
  {
    "q": "橄榄球的发源地是哪里",
    "a": "英国",
  },
  {
    "q": "公元前27年，罗马共和国名存实亡，古罗马文明进入帝国时代，请问，以下哪一位是罗马帝国的第一位皇帝",
    "a": "盖维斯·屋大维·奥古斯都",
  },
  {
    "q": "古人称长庚指的是",
    "a": "金星",
  },
  {
    "q": "关于中药归类正确的是",
    "a": "甘味药：当归、人参",
  },
  {
    "q": "观察以下［1］－［4］符号排序并选择正确答案：［1］！！@＃¥［2］％％¥@＃［3］＊＊＊＊@［4］@％％¥＊",
    "a": "％@！！！",
  },
  {
    "q": "海南四大名菜中没有哪一样",
    "a": "鱼",
  },
  {
    "q": "河畔普通用户组最高级别是",
    "a": "传奇蝌蚪",
  },
  {
    "q": "郊游时，看见野生蘑菇，您应该怎么做？",
    "a": "野生的蘑菇不安全，不采摘也不食用",
  },
  {
    "q": "巾帼不让须眉的“巾帼”指的是",
    "a": "女子",
  },
  {
    "q": "锦官城指的是",
    "a": "成都",
  },
  {
    "q": "经常用来庆祝胜利的香槟酒起源于哪个国家",
    "a": "法国",
  },
  {
    "q":
        "老王和小明共同完成a、b两个编程，老王单独完成a需要13天，单独完成b需要7天；小明单独完成a需要11天，单独完成b需要9天。如果他俩合作用最短的时间完成这俩编程，在最后一天他俩需要共同工作多长时间",
    "a": "1月6日",
  },
  {
    "q": "利用凸透镜透光原理的是",
    "a": "显微镜目镜",
  },
  {
    "q": "连接沙河校区和清水河校区之间的通勤车是",
    "a": "396",
  },
  {
    "q": "六合除了东南西北还包括",
    "a": "上下",
  },
  {
    "q": "每年毕业季，清水河最香的花是什么花：",
    "a": "栀子花",
  },
  {
    "q": "蜜月最初是要喝（）天的蜜水或蜜酒",
    "a": "30",
  },
  {
    "q":
        "某企业投资汽车生产，生产一辆汽车所耗费 的生产资料价值为15万元。支付给工人的工资为5万元，假定市场的平均利润率为10%，那么，在自由竞争条件下，该汽车的生产价格是",
    "a": "22万元",
  },
  {
    "q": "某人由于营养不良，身体浮肿，其食疗补救措施是",
    "a": "多喝豆汁",
  },
  {
    "q":
        "某一比赛所有参赛者获得名次之和为300（无并列名次），其中a、b、c部门参赛者获得名次平均数分别为11.3、10.4和9.2，问其他部门获得的名次最高为多少",
    "a": "20",
  },
  {
    "q": "某一天一个陌生号码打过来说是你们家邻居，现在家人出了车祸正在医院，急需交钱做手术，给你一个银行账号，你应该",
    "a": "打电话问家人核实情况",
  },
  {
    "q": "目前天府新区还能买房吗",
    "a": "能",
  },
  {
    "q": "目无全牛是贬义词",
    "a": "错",
  },
  {
    "q": "哪个国家没有猫",
    "a": "马尔代夫",
  },
  {
    "q": "你是哪一年时代周刊封面人物",
    "a": "2006",
  },
  {
    "q": "清水河畔玫瑰勋章不包括",
    "a": "白玫瑰",
  },
  {
    "q": "请问世界上第一个完成环球航行的航海家是谁",
    "a": "胡安·塞巴斯蒂安·埃尔卡诺",
  },
  {
    "q": "请问世界上第一台蒸汽机的发明者是谁",
    "a": "希罗",
  },
  {
    "q": "人们常说花季的年纪指多少岁",
    "a": "16",
  },
  {
    "q": "人体最大块的肌肉是",
    "a": "臀肌",
  },
  {
    "q": "如果一个牌友一直不说话，且脸色通红，还时不时将牌乱摔说明他",
    "a": "输钱了",
  },
  {
    "q": "三教九流（亦作九流三教）泛指古代中国的宗教与各种学术流派，是古代中国对人的地位和职业名称划分的等级。其中“三教”通常是指：",
    "a": "儒教、道教、佛教",
  },
  {
    "q": "上路汽车必须买的险种是",
    "a": "交强险",
  },
  {
    "q": "设A,B,C均为n阶矩阵，若AB=C,且B可逆，则",
    "a": "矩阵C的列向量组与矩阵A的列向量组等价",
  },
  {
    "q": "苏轼称赞（）“诗中有画，画中有诗。”",
    "a": "王维",
  },
  {
    "q": "俗称“四不象”的动物是",
    "a": "麋鹿",
  },
  {
    "q": "太阳的能量来源是",
    "a": "核聚变",
  },
  {
    "q": "文章本天成，妙手偶得之出自谁之口",
    "a": "陆游",
  },
  {
    "q": "文章本无成，妙手偶得之出自谁之口？",
    "a": "杜甫",
  },
  {
    "q": "我国采用北京所在的东八时区的区时作为标准时间，称为北京时间，其 发布地位于",
    "a": "临潼",
  },
  {
    "q": "下列年龄最大的是",
    "a": "伯",
  },
  {
    "q": "下列情况不构成医疗事故罪的是",
    "a": "药剂师甲在配药时心不在焉，错将应当给丙的药给了乙，幸亏当时被乙发现，否则将造成十分严重的后果",
  },
  {
    "q": "下列有关生活常识的叙述正确的是",
    "a": "使用无磷洗衣粉是因为磷易造成环境水体富营养化，破坏水质",
  },
  {
    "q": "香槟酒起源于哪个国家",
    "a": "法国",
  },
  {
    "q":
        "小a和小b是电子科大的学生，以下三个结论其中只有1个是真的，则选项中哪个结论必然是真的：1.电子科大有的人是男生。2.电子科大有的人不是男生。3.小a和小b都不是男生",
    "a": "小a和小b都是男生",
  },
  {
    "q": "小明最近身体不适，在某医院被告知需要手术治疗，他最需要做的是",
    "a": "去其他靠谱的医院确诊一下再决定",
  },
  {
    "q": "新买7座以下车辆第一次上线年审是第_年",
    "a": "6",
  },
  {
    "q": "新中国成立后，发生了几场中国对外战争",
    "a": "6",
  },
  {
    //How do you like the film? ---There was nothing special--- it was only ____
    //How do you like the film? ---There was nothing special--- it was only ____
    "q": "匈奴未灭，何以家为”是谁的豪言",
    "a": "霍去病",
  },
  {
    "q": "幺鸡是指哪张牌",
    "a": "一条",
  },
  {
    "q": "药库中有14600g浓度为98%的酒精，加入多少克蒸馏水后可稀释成73%的消毒酒精",
    "a": "5000",
  },
  {
    "q": "一本书共60页，小明第一天看了1/5，第二天看了剩下的1/4，第三题看了剩下的1/3，剩下的第四天看完，第四天看了多少页",
    "a": "24",
  },
  {
    "q": "一无良商家将一款商品加价4折以后又8折出售，实际售价比原价还高24元 这款商品原价是多少",
    "a": "200",
  },
  {
    "q": "一张20元人民币破损了2分之1，到银行可以兑换到多少钱",
    "a": "10",
  },
  {
    "q": "移动终端上最常用处理器架构是",
    "a": "arm",
  },
  {
    "q": "以下不属于古诗十九首的是",
    "a": "《十五从军征》",
  },
  {
    "q": "以下哪个不是南京的称谓",
    "a": "羊城",
  },
  {
    "q": "以下哪一地名不是成都的地名",
    "a": "地安门",
  },
  {
    "q":
        "有人从一手纸牌中选定一张牌,他把这张牌的花色告诉X先生,而把点数告诉了Y先生.两位先生都知道这手纸牌是：黑桃J、8、4、2;红心A、Q、4;方块A、5;草花K、Q、5、4.X先生和Y先生都很精通逻辑,很善于推理.他们之间有对话如下：Y先生：我不知道这张牌.X先生：我知道你不知道这张牌.Y先生：现在我知道这张牌了.X先生：现在我也知道了.",
    "a": "方块5",
  },
  {
    "q": "与南冠意思一样的是",
    "a": "囚犯",
  },
  {
    "q": "与三尺意思一样的是",
    "a": "法律",
  },
  {
    "q": "与桑梓意思一样的是",
    "a": "故乡/家乡",
  },
  {
    "q": "与我国接壤的金砖国家有（）个",
    "a": "2",
  },
  {
    "q": "与须眉意思一样的是",
    "a": "男子",
  },
  {
    "q": "在真空里同为一吨重的木头和铁块，在空气里哪个更重",
    "a": "木头",
  },
];
