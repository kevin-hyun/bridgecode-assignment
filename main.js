const app = Vue.createApp({
  data() {
    return {
      search: "",
      HTMLcontent: "",
      list: [
        "서버 개발자",
        "프론트엔드 개발자",
        "iOS 개발자",
        "안드로이드 개발자",
        "QA 테스트 엔지니어",
        "머신러닝 엔지니어",
        "데이터 엔지니어",
        "보안 엔지니어",
        "CTO",
        "임베디드 개발자",
        "시스템・네트워크 관리자",
        "시스템 설계",
        "DevOps",
        "DBA",
        "영상・음성 엔지니어",
        "그래픽스 엔지니어",
        "CIO",
      ],
    };
  },
  methods: {
    highlightWord(search, word) {
      const regExp = new RegExp(search, "ig");
      const matched = word.match(regExp);
      this.HTMLcontent = word.replace(matched, `<strong>${matched}</strong>`);

      return null;
    },
  },

  computed: {
    searchResult() {
      if (this.search) {
        return this.list.filter((item) => {
          const result = item.includes(this.search);
          return result;
        });
      } else {
        return null;
      }
    },
  },
});
