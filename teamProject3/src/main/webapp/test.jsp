<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
new Vue({
	  el: "#app",
	  vuetify: new Vuetify()
	});
</script>
<style type="text/css">
.d-flex {
  display: flex;
}
.justify-center {
  justify-content:center;
}
.justify-space-between {
  justify-content:space-between;
}

.mx-2 {
  margin-right:30px;
  margin-left:30px;
}

.mt-1 {
  margin-top: 15px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="app">
  <v-card>
    <v-card-title class="heaedline">
      <div>確認付款資訊</div>
      <v-spacer></v-spacer>
      <v-btn icon @click="dialog = false">
        <v-icon>mdi-close</v-icon>
      </v-btn>
    </v-card-title>
    <v-card-text>
      <div class="d-flex justify-center">
        <div class="d-flex mx-2">
          <div>代收金額：</div>
          <div>2322</div>
        </div>
        <div class="d-flex mx-2">
          <div>已收金額：</div>
          <div>2322</div>
        </div>
        <div class="d-flex mx-2">
          <div>總額：</div>
          <div>2322</div>
        </div>
        <div class="d-flex mx-2">
          <div>使用專案：</div>
          <div>2322</div>
        </div>
      </div>
      <v-row>
        <v-col cols="6">
          <v-select label="收款人員" />
        </v-col>
        <v-col cols="6">
          <v-select label="收款類型" />
        </v-col>
        <v-col cols="6">
          <v-text-field label="收款日期" />
        </v-col>
      </v-row>

      <v-card outlined>
        <v-card-text>
      <v-row>
        <v-col cols="6">
          <v-select label="收款方式" />
        </v-col>
        <v-col cols="6">
          <v-text-field label="備註" />
        </v-col>
        <v-col cols="6">
          <v-text-field label="收款金額">
            </v-text-filed>
            <v-checkbox label="同待收金額"></v-checkbox>
        </v-col>
      </v-row>
          </v-card-text>
        </v-card>
      <div class="d-flex mt-1">
        <v-spacer></v-spacer>
        <v-btn outlined>
          <v-icon>mdi-plus</v-icon>
          增加
        </v-btn>
      </div>
    </v-card-text>
    <v-card-actions>
      <v-spacer></v-spacer>
      <v-btn color="primary">
        完成
      </v-btn>
    </v-card-actions>
  </v-card>
</div>
</body>
</html>