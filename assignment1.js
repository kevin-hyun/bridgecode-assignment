// nick에 없는 랜덤 이름 출력하기

// 랜덤 인덱스를 가져와서 조합 - Math.random
// 만약 그게 nick에 있다면 다시 시도  - include + recursion
// 없다면 출력 후 nick에 추가  - 모두 인쇄할 필요없이 함수 돌릴 때마다 출력 1개씩
// 더이상 출력할 것이 없다면 종료 출력

const source1 = ["감자", "양파", "대파", "피망", "대추"];
const source2 = ["고래", "기린", "비버", "참새", "비둘기"];

const nick = ["감자비버", "양파비둘기", "피망고래", "대추기린"];

const getRandomNum = (array) => {
  const randomNum = Math.random() * 5;
  const randomNumFloor = Math.floor(randomNum);
  return array[randomNumFloor];
};
const randomNick = (sourceArr1, sourceArr2, nickArr) => {
  const word = getRandomNum(sourceArr1) + getRandomNum(sourceArr2);

  if (nickArr.includes(word)) {
    if (sourceArr1.length * sourceArr1.length === nickArr.length) {
      return "종료";
    } else {
      return randomNick(sourceArr1, sourceArr2, nickArr);
    }
  } else {
    nickArr.push(word);
    return word;
  }
};

for (const x of Array(100).keys()) {
  randomNick(source1, source2, nick);
}

console.log(nick.sort());
