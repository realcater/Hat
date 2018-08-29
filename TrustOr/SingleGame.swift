import UIKit

enum AnswerChoice {
    case trueAnswer
    case doubtAnswer
    case falseAnswer
}

class SingleGameState {
    enum AnswerState {
        case notAnswered
        case answered
        case finishGame
        case gotResults
    }
    
    var currentNumber: Int
    var answerState: AnswerState
    var score: Int
    var lastAnswer: AnswerChoice
    var answerResultString: String
    init() {
        currentNumber = 0
        answerState = .notAnswered
        score = 0
        lastAnswer = .trueAnswer
        answerResultString = ""
    }
}

class SingleGame {
    var questionText: UITextView
    var commentText: UITextView
    var trueAnswerButton: UIButton
    var doubtAsnwerButton: UIButton
    var falseAsnwerButton: UIButton
    var nextQuestionButton: UIButton
    var finishGameButton: UIButton
    var resultLabel: UILabel
    
    var questionsPack : QuestionsPack!
    var state: SingleGameState!
    weak var delegate: GameDelegate?
    
    init(delegate: GameDelegate, questionsPack: QuestionsPack, state: SingleGameState, questionText: UITextView, commentText: UITextView, trueAnswerButton: UIButton, doubtAsnwerButton: UIButton, falseAsnwerButton: UIButton, nextQuestionButton: UIButton, finishGameButton: UIButton, resultLabel: UILabel) {
        self.delegate = delegate
        self.questionsPack = questionsPack
        self.state = state
        self.questionText = questionText
        self.commentText = commentText
        self.trueAnswerButton = trueAnswerButton
        self.doubtAsnwerButton = doubtAsnwerButton
        self.falseAsnwerButton = falseAsnwerButton
        self.nextQuestionButton = nextQuestionButton
        self.finishGameButton = finishGameButton
        self.resultLabel = resultLabel
        restoreState()
    }
    
    //MARK:- Game logic = Data change functions
    func answerIsTrue() {
        state.answerResultString = K.winResultString
        state.score += 1
    }
    func answerIsFalse() {
        state.answerResultString = K.looseResultString
        state.score -= 1
    }
    func answerIsDoubt() {
        state.answerResultString = K.doubtResultString
    }

    func answerButtonPressed(button: AnswerChoice) {
        state.answerState = .answered
        if button == .doubtAnswer {
            answerIsDoubt()
        } else if (questionsPack.questionTasks[state.currentNumber].answer == true) && (button == .trueAnswer) || (questionsPack.questionTasks[state.currentNumber].answer == false) && (button == .falseAnswer) {
            answerIsTrue()
        } else {
            answerIsFalse()
        }
        if state.currentNumber+1 < questionsPack.questionTasks.count {
            showUIWaitMode()
        } else {
            state.answerState = .finishGame
            showUIFinishGame()
        }
    }
    func nextQuestionButtonPressed() {
        state.currentNumber+=1
        showUIAnswerMode()
        state.answerState = .notAnswered
    }
    func getResultsButtonPressed() {
        showUIResults()
        state.answerState = .gotResults
    }
    
    func finishGameButtonPressed() {
        delegate?.returnToStartView()
    }
    func getShortResultsText() -> String {
        return "Вы набрали: 🏅\(state.score)"
    }
    func getFullResultsText() -> String {
        var text: String
        switch abs(state.score) {
        case 0...2:
            text = "Да, с годом \(questionsPack.name_gen) у вас явно сложные отношения - будем откровенны, не самый высокий результат... Но всегда есть куда стремиться! Может, попробовать другой год?"
        case 3...5:
            text = "Поздравляем! Вы вошли в число 29% людей, которые справились лучше всего справились с данным заданием! В логике или удачи вам не откажешь!"
        case 6...8:
            text = "Поздравляем! Вы вошли в число 7% людей, которые справились лучше всего справились с данным заданием! Вы чертовски умны и сообразительны или просто на короткой ноге с Тюхе!"
        case 9...11:
            text = "Фантастический результат! Вы вошли в число 2% людей, которые справились лучше всего справились с данным заданием! Вашей эрудиции и логике можно только позавидовать!"
        case 12...18:
            text = "Нереальный результат! Вы вошли в число 0.3% людей, которые справились лучше всего справились с данным заданием! Срочно играть в ”Что? Где? Когда?”!"
        default:
            text = "Все ответы верные? Серьёзно? Одно из двух: или вы играете не в первый раз, или ваша фамилия - Бер!"
        }
        if state.score < -2 {
            text = text + " (Да, мы в курсе, что вы отвечали специально неправильно! Но нас не проведёшь!)"
        }
        return text
    }
    
    //MARK:- UI Change functions
    func restoreState() {
        switch state.answerState {
        case .answered: showUIWaitMode()
        case .finishGame: showUIFinishGame()
        case .notAnswered: showUIAnswerMode()
        case .gotResults: showUIResults()
        }
        reloadTexts()
    }
    private func reloadTexts() {
        questionText.text = questionsPack.questionTasks[state.currentNumber].question
        commentText.text = questionsPack.questionTasks[state.currentNumber].comment
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.questionText.flashScrollIndicators()
        })
        var score = String(state.score)
        if state.score > 0 { score = "+"+score }
        if state.score == 0 { score = " "+score }
        /*
        let string1 = "\(K.questionLabel)\(state.currentNumber+1)/\(questionsPack.questionTasks.count)"
        let font1 = UIFont.systemFont(ofSize: CGFloat(18))
        let title1 = NSMutableAttributedString(string: string1, attributes: [NSMutableAttributedString.Key.font: font1])
        
        let string2 = "\(K.scoreLabel)"
        let font2 = UIFont.systemFont(ofSize: CGFloat(36))
        let title2 = NSMutableAttributedString(string: string2, attributes: [NSMutableAttributedString.Key.font: font2])
        
        let string3 = "\(score)"
        let font3 = UIFont.systemFont(ofSize: CGFloat(18))
        let title3 = NSMutableAttributedString(string: string3, attributes: [NSMutableAttributedString.Key.font: font3])
        */
        delegate?.setAttributedTitle()
    }
    private func showAnswer() {
        commentText.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.commentText.flashScrollIndicators()
        })
        if questionsPack.questionTasks[state.currentNumber].answer == true {
            resultLabel.backgroundColor = K.trueAnswerBarColor
            switch state.answerResultString {
            case K.winResultString:
                resultLabel.text = K.trueTextWin
            case K.looseResultString:
                resultLabel.text = K.trueTextLoose
            default:
                resultLabel.text = K.trueTextLoose
            }
        } else {
            resultLabel.backgroundColor = K.falseAnswerBarColor
            switch state.answerResultString {
            case K.winResultString:
                resultLabel.text = K.falseTextWin
            case K.looseResultString:
                resultLabel.text = K.falseTextLoose
            default:
                resultLabel.text = K.falseTextLoose
            }
        }
        resultLabel.text = resultLabel.text! + state.answerResultString
        resultLabel.isHidden = false
        reloadTexts()
    }
    private func hideAnswer() {
        commentText.isHidden = true
        resultLabel.isHidden = true
    }
    private func showUIAnswerMode() {
        hideAnswer()
        nextQuestionButton.isHidden = true
            
        trueAnswerButton.setTitle(K.trustText, for: .normal)
        trueAnswerButton.backgroundColor = K.trueAnswerButtonColor
        trueAnswerButton.isHidden = false
        
        doubtAsnwerButton.setTitle(K.doubtText, for: .normal)
        doubtAsnwerButton.backgroundColor = K.doubtAnswerButtonColor
        doubtAsnwerButton.isHidden = false
        
        falseAsnwerButton.setTitle(K.notTrustText, for: .normal)
        falseAsnwerButton.backgroundColor = K.falseAnswerButtonColor
        falseAsnwerButton.isHidden = false
        
        reloadTexts()
    }
    private func showUIWaitMode() {
        showAnswer()
        trueAnswerButton.isHidden = true
        doubtAsnwerButton.isHidden = true
        falseAsnwerButton.isHidden = true

        nextQuestionButton.setTitle(K.nextQuestionButtonText, for: .normal)
        nextQuestionButton.backgroundColor = K.foregroundColor
        nextQuestionButton.isHidden = false
    }
    private func showUIFinishGame() {
        showAnswer()
        trueAnswerButton.isHidden = true
        doubtAsnwerButton.isHidden = true
        falseAsnwerButton.isHidden = true
        
        finishGameButton.setTitle(K.showResultsText, for: .normal)
        finishGameButton.backgroundColor = K.foregroundColor
        finishGameButton.isHidden = false
    }
    private func showUIResults() {
        hideAnswer()
        finishGameButton.setTitle(K.finishGameButtonText, for: .normal)
        questionText.text = getFullResultsText()
        questionText.isHidden = false
        resultLabel.text = getShortResultsText()
        resultLabel.backgroundColor = K.trueAnswerBarColor
        resultLabel.isHidden = false
    }
}
