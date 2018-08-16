struct QuestionTask {
    var question: String
    var answer: Bool
    var comment: String
}

struct Animal {
    var name_gen : String
    var picname : String
    var num : Int
    var questionTasks: [QuestionTask]
}

struct ChineseAnimals {
    var items: [Animal]
    init() {
        let mouse = Animal(name_gen : "Мыши или Крысы", picname : "0", num : 0, questionTasks : [
            QuestionTask(
                question: "Верите ли вы, что летучие мыши – вампиры - на самом деле существуют?",
                answer: true,
                comment: "Род млекопитающих семейства листоносов, отряда рукокрылых"),
            QuestionTask(
                question: "Верите ли вы, что глобализация дошла до того, что японский монетный двор выпустил к Новому году крысы монету с изображением Микки-Мауса?",
                answer: false,
                comment: "Монету выпустили, но в Китае. Японцы пока себе такого не позволяют"),
            QuestionTask(
                question: "Верите ли вы, что мультфильм “Рататуй” про крысу-повара должен был выйти в канун Нового года. Но пираты украли копию, и пришлось выпускать фильм на полгода раньше?",
                answer: false,
                comment: "История придумана автором"),
            QuestionTask(
                question: "Верите ли вы, что в Новосибирске два года назад установили памятник главной жертве науки – лабораторной мыши?",
                answer: true,
                comment: ""),
            QuestionTask(
                question: "Верите ли вы, что генетически модифицированную мышь, которая дожила по человеческим меркам до 136 лет, назвали Сплинтер в честь учителя черепашек-ниндзя?",
                answer: false,
                comment: "Её назвали Йода, в честь учителя джедаев"),
            QuestionTask(
                question: "Верите ли вы, что в индийской мифологии крысу в качестве ездового животного использовали и верховный бог Брахма, и бог любви Кама?",
                answer: false,
                comment: "Только слоноголовый бог Ганеша"),
            QuestionTask(
                question: "Верите ли вы, что слово “мышь” образовано от греческого глагола со значением “воровать”?",
                answer: true,
                comment: "Поэтому мышь – символ воровства. На Руси ее часто называли “серым воришкой”"),
            QuestionTask(
                question: "Верите ли вы, что, на самом деле, мыши и крысы даже не родственники. Ведь мыши относятся к семейству мышиных, а крысы – крысиных?",
                answer: false,
                comment: "И мыши, и крысы относятся к семейству мышиных"),
            QuestionTask(
                question: "Верите ли вы, что для китайцев крыса – почти как для греков Прометей? Ведь именно крыса принесла человеку рис.",
                answer: true,
                comment: ""),
            QuestionTask(
                question: "Верите ли вы, что в Африке мышей используют для предсказаний, ведь считается, что они знают тайны загробного мира?",
                answer: true,
                comment: ""),
            QuestionTask(
                question: "Верите ли вы, что крысе Шушаре из “Золотого ключика” дал имя посёлок в пригороде Ленинграда?",
                answer: true,
                comment: "Посёлок Шушары. Толстой долго ждал там поезда под дождем, обозлился и назвал так противную крысу"),
            QuestionTask(
                question: "Верите ли вы, что крыс использовали во время войны как индикаторов появления в окопах отравляющих газов?",
                answer: true,
                comment: ""),
            QuestionTask(
                question: "Верите ли вы, что во время Первой мировой войны у немцев был сверхтяжёлый танк, который назывался “Маус”, то есть “мышь”?",
                answer: false,
                comment: "Был, но во время Второй мировой"),
            QuestionTask(
                question: "Верите ли вы, что смертельный яд можно перепутать с мышью, в результате чего убить человека?",
                answer: true,
                comment: "Гамлет с криком “Там мышь!” проткнул шпагой Полония, который стоял за ширмой (Полоний - радиоактивный химический элемент)"),
            QuestionTask(
                question: "Верите ли вы, что в Австралии одного утконоса можно обменять на 20 сумчатых крыс?",
                answer: true,
                comment: "Сумчатая крыса изображена на самой мелкой австралийской монете достоинством в 1 цент, а утконос – на 20-центовой монете"),
            QuestionTask(
                question: "Верите ли вы, что фольга на бутылках шампанского появилась лишь в XIX веке для того, чтобы отпугивать крыс?",
                answer: true,
                comment: ""),
            QuestionTask(
                question: "Верите ли вы, что в Ирландии и Перу мышей научились использовать угонщики автомобилей. Мыши перегрызают проводку сигнализации?",
                answer: false,
                comment: "Пару мышек подбрасывают через окно в автомобиль с женщиной-водителем, после того, как она с визгом убегает из автомобиля, все ценное выносится"),
            QuestionTask(
                question: "Верите ли вы, что серая крыса постоянно что-то грызёт, потому что ей требуется до килограмма еды в день?",
                answer: false,
                comment: "Всего 70 грамм. Но она постоянно должна стачивать зубы. Если не будет делать этого, просто не сможет сомкнуть пасть и умрёт от голода"),
            QuestionTask(
                question: "Верите ли вы, что мышь однажды стала причиной авиакатастрофы?",
                answer: false,
                comment: "Хотя рейс Боинга-767 отменили, чтобы поймать мышь, которая забралась в кабину пилота. Мало ли какой важный проводок перегрызет…")
        ])
        let ox = Animal(name_gen : "Быка или Коровы", picname : "1", num : 1, questionTasks : [
            QuestionTask(
                question: "Верите ли вы, что игру “Быки и коровы“, где надо угадывать число, загаданное соперником, придумал ещё Ломоносов?",
                answer: false,
                comment: "Факт придуман автором вопроса."),
            QuestionTask(
                question: "Верите ли вы, что именно корове человечество обязано победой над страшной болезнью – оспой?",
                answer: true,
                comment: "Английский врач Эдуард Дженнер в 1796 году предложил использовать выделения из ран коров, больных коровьей оспой, для прививок человеку от черной оспы. Он же придумал слово “вакцина“, от латинского vacca - корова."),
            QuestionTask(
                question: "Верите ли вы, что в авгиевых конюшнях, которые очистил Геракл, содержались быки?",
                answer: true,
                comment: "Читайте хоть Куна, хоть Грейвса, хоть Аполлодора."),
            QuestionTask(
                question: "Верите ли вы, что в Пенсильвании в честь основателя знаменитой кондитерской компании Милтона Херши создали скульптурную группу? Бизнесмен и две коровы выполнены из шоколада.",
                answer: false,
                comment: "Херши сделан из шоколада. А коровы – из масла."),
            QuestionTask(
                question: "Верите ли вы, что в индийской мифологии быка Нанди в качестве ездового животного использовал танцующий бог Шива?",
                answer: true,
                comment: ""),
            QuestionTask(
                question: "Верите ли вы, что, согласно индуистским текстам, убийство быка в Индии каралось более сурово, чем убийство коровы?",
                answer: true,
                comment: ""),
            QuestionTask(
                question: "Верите ли вы, что, несмотря на название, в состав знаменитых конфет “Коровка” молоко не входит?",
                answer: false,
                comment: "Состав – сахар, молоко, фруктовая патока и добавки."),
            QuestionTask(
                question: "Верите ли вы, что быки практически не различают цвета? Поэтому, будь на корриде вместо красной тряпки зелёная или синяя, ничего бы не изменилось?",
                answer: true,
                comment: "За цветное зрение в глазу отвечают колбочки. А у быка их почти нет. Реагирует бык на движение."),
            QuestionTask(
                question: "Верите ли вы, что мясо убитого на корриде быка запрещено продавать и употреблять в пищу, поскольку животное от ярости выделяет вредные для человека вещества?",
                answer: false,
                comment: "Это полная ерунда. Мясо убитых животных идёт на продажу."),
            QuestionTask(
                question: "Верите ли вы, что древние греки называли Крым полуостровом быков?",
                answer: true,
                comment: "Крым носил название Таврида. По-гречески Таврос – бык."),
            QuestionTask(
                question: "Верите ли вы, что развод некоторых мостов в Санкт-Петербурге осуществлялся с помощью быков?",
                answer: true,
                comment: "Бык  - это опора моста. У Троицкого и некоторых других мостов ось вращения подъемного механизма располагалась в гранитных быках."),
            QuestionTask(
                question: "Верите ли вы, что шумеры называли луну “безбородым быком“?",
                answer: false,
                comment: "Наоборот – “бородатым быком“."),
            QuestionTask(
                question: "Верите ли вы, что у реки Днестр есть приток – речка Бык, на которой стоит столица Румынии Бухарест?",
                answer: false,
                comment: "На реке Бык стоит не Бухарест, а Кишинёв. Бухарест стоит на Дымбовице."),
            QuestionTask(
                question: "Верите ли вы, что в желудках коров находили целые книжки?",
                answer: true,
                comment: "Только это не те книжки. Желудок коровы разделен на 4 отдела, которые называются рубец, сетка, книжка и сычуг."),
            QuestionTask(
                question: "Верите ли вы, что имя Гаврюша придумал для телёнка из Простоквашино кот Матроскин?",
                answer: false,
                comment: "Дядя Фёдор. Матроскин предлагал сначала имя Аристофан, потом Стремительный. А Шарик – сначала Барбос, потом Чайник."),
            QuestionTask(
                question: "Верите ли вы, что два быка на флаге Андорры символизируют героическую борьбу андоррцев против Испании и Франции?",
                answer: false,
                comment: "Они символизируют совместное французско-испанское управление Андоррой. Никто там и не думал бороться."),
            QuestionTask(
                question: "Верите ли вы, что эпизод про перевозку и сброс коровы с самолёта из “Особенностей национальной охоты“ основан на реальных событиях, происшедших ещё во времена Союза?",
                answer: true,
                comment: "В Ростовской области на военном аэродроме."),
            QuestionTask(
                question: "Верите ли вы, что по восточной традиции Час Быка – это вовсе не один час, а два – с часа до трёх часов ночи?",
                answer: true,
                comment: "Сутки делятся на 12 животных – символов восточного года."),
            QuestionTask(
                question: "Верите ли вы, что в первоначальном варианте повесть “Бэмби“ рассказывала о сбежавшем в лес телёнке? И лишь издатель настоял, чтобы автор заменил телёнка на оленёнка?",
                answer: false,
                comment: "Факт придуман автором вопроса"),
            QuestionTask(
                question: "Верите ли вы, что дружба с “Красным быком“ значительно повышает риск сердечного приступа?",
                answer: true,
                comment: "Имеется ввиду энергетический напиток Red Bull. Исследование проводили австралийские врачи."),
            QuestionTask(
                question: "Верите ли вы что слова “говядина” и “говно” происходят от одного праиндоевропейского корня?",
                answer: true,
                comment: "Изначально “говно“ – это были именно коровьи лепёшки.")
            ])
        items=[mouse,ox]
        print("init chinese animals")
    }
}

