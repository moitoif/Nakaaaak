<template>
  <div id="IllustCanvas">
    <v-stage 
      ref="stage"
      :config="configKonva"
    >
      <v-layer ref="layer">
        <v-image :config="configImage"></v-image>
         <v-text
          v-for="(item) in listLabel"
          :key="item.config.name"
          :ref="item.config.name"
          :config="item.config"
          @click="editText"
        />
        <v-transformer
          ref="transformerText"
          :config="{
            anchorStroke: 'red',
            anchorFill: 'red',
            anchorSize: 5,
            borderStroke: 'red',
            borderDash: [5, 5],
            padding: 5
          }"
        />
        
        <!-- <v-label :config="labelConfig">
          <v-tag :config="tagConfig" />
          <v-text :config="textConfig"/>
        </v-label> -->
        <!-- <v-transformer
          ref="transformerText"
          :config="{
            anchorStroke: 'red',
            anchorFill: 'red',
            anchorSize: 5,
            borderStroke: 'red',
            borderDash: [5, 5],
            padding: 5
          }"
          @transformstart="handleTransformStart"
          @transformend="handleTransformEnd"
        /> -->
        <!-- <v-label 
          v-for="(item) in listLabel"
          :key="item.config.name"
          :config="labelConfig">
          <v-tag 
            :config="tagConfig" 
          />
          <v-text
            :ref="item.config.name"
            :config="item.config"
            @click="editText"
          />
        </v-label>
        <v-transformer
          ref="transformerText"
          :config="{
            anchorStroke: 'red',
            anchorFill: 'red',
            anchorSize: 5,
            borderStroke: 'red',
            borderDash: [5, 5],
            padding: 5
          }"
        /> -->
      </v-layer>
    </v-stage>
    <button @click="addLabel">コメントを追加する</button>
  </div>
</template>

<script>

const canvasWidth = 1200;
const canvasHeight = 800;

let vm = {};
let stage = null;
let layer = null;
let textNode = null;
let tr = null;

export default {
  props: {
    file: {
      type: String,
      default: null
    },
    user: {
      type: Number,
      default: null
    }
  },
  data() {
    return {
      configKonva: {
        width: canvasWidth, 
        height: canvasHeight,
      },
      image: null,
      configLabel: {
        w: 20,
        y: 20,

      },
      numberRefs: 0,
      lastPointerPosition: {
        x: 0,
        y: 0
      },
      listNote: [],
      listLabel: [],
      selectedShapeName: "",
      
      // labelConfig: {
      //   x: 170,
      //   y: 75,
      //   opacity: 0.75,
      //   draggable: true
      // },
      // tagConfig: {
      //   height: 20,
      //   fill: 'black',
      //   pointerDirection: 'left',
      //   pointerWidth: 20,
      //   pointerHeight: 10,
      //   lineJoin: 'round',
      // },
      // textConfig: {
      //   text: "テスト用テキスト",
      //   fontSize: 20,
      //   fontWeight: 'bold',
      //   padding: 10,
      //   stroke: 'black',
      //   strokeWidth: 1,
      // },
    };
  },
  created() {
    const image = new Image(900,700);
    image.src = require(`../../public/users/${this.user}/${this.file}`)
    image.onload = () => {
      this.image = image
    };
  },  
  computed: {
    configImage: function() {
      return {
        x: 150,
        y: 50,
        image: this.image,
      }
    }
  },
  methods: {
    addTransformerImmediate(name_refs = "") {
      textNode = vm.$refs[name_refs][0].getNode();
      this.selectedShapeName = name_refs;
      this.updateTransformer();
    },
    updateTransformer() {
      const transformerNode = this.$refs.transformerText.getStage();
      const stage = transformerNode.getStage();
      const { selectedShapeName } = this;
      const selectedNode = stage.findOne("." + selectedShapeName);
      
      if (selectedNode === transformerNode.node()) {
        return;
      }

      if (selectedNode) {
        transformerNode.attachTo(selectedNode);
      } else {
        transformerNode.detach();
      }

      transformerNode.getLayer().batchDraw();
    },
    // canvas上にラベルを追加する。
    addLabel() {
      this.numberRefs += 1; 
      let new_note = {
        config: {
          width: 150,
          text: "ラベル追加テスト",
          draggable: true,
          name: `label${this.numberRefs}`,
          x: this.lastPointerPosition.x || 100,
          y: this.lastPointerPosition.y || 0,
          ellipsis: true,
          fill: "red",
          backgroundColor: "#FFAAFF"
        },
      };
      let numberNote = this.listLabel.length;
      this.$set(this.listLabel, numberNote, new_note);
      
      this.$nextTick(() => {
        this.addTransformerImmediate(this.listLabel[numberNote].config.name);
      });
    },
    // addNote() {
    //   this.numberRefs += 1;
    //   let new_note = {
    //     config: {
    //       width: 150,
    //       text: "TestNote",
    //       fontSize: fontSize,
    //       fontFamily: fontFamily,
    //       // draggable: true,
    //       name: `text${this.numberRefs}`,
    //       x: this.lastPointerPosition.x || 100,
    //       y: this.lastPointerPosition.y || 0,
    //       ellipsis: true,
    //       fill: "red",
    //       backgroundColor: "#FFAAFF"
    //     }
    //   };
    //   let numberNote = this.listNote.length;
    //   this.$set(this.listNote, numberNote, new_note);

    //   this.$nextTick(() => {
    //     this.addTransformerImmediate(this.listNote[numberNote].config.name);
    //   });
    // },

    editText(e) {
      vm = this;
      textNode = vm.$refs[e.target.attrs.name][0].getNode();
      console.log(textNode.VueComponent);
      textNode.hide();
      tr.hide();

      var textPosition = textNode.absolutePosition();

      var stageBox = stage.container().getBoundingClientRect();

      var areaPosition = {
        x: stageBox.left + textPosition.x,
        y: stageBox.top + textPosition.y
      };

      var textarea = document.createElement("textarea");
      document.body.appendChild(textarea);

      textarea.value = textNode.text();
      textarea.style.position = "absolute";
      textarea.style.top = areaPosition.y + "px";
      textarea.style.left = areaPosition.x + "px";
      textarea.style.width = textNode.width() - textNode.padding() * 2 + "px";
      textarea.style.height =
        textNode.height() - textNode.padding() * 2 + 5 + "px";
      textarea.style.fontSize = textNode.fontSize() + "px";
      textarea.style.border = "none";
      textarea.style.padding = "0px";
      textarea.style.margin = "0px";
      textarea.style.overflow = "hidden";
      textarea.style.background = "blue";
      textarea.style.outline = "none";
      textarea.style.resize = "none";
      textarea.style.lineHeight = textNode.lineHeight();
      textarea.style.fontFamily = textNode.fontFamily();
      textarea.style.transformOrigin = "left top";
      textarea.style.textAlign = textNode.align();
      textarea.style.color = textNode.fill();
      var rotation = textNode.rotation();
      var transform = "";
      if (rotation) {
        transform += "rotateZ(" + rotation + "deg)";
      }

      var px = 0;
      var isFirefox = navigator.userAgent.toLowerCase().indexOf("firefox") > -1;
      if (isFirefox) {
        px += 2 + Math.round(textNode.fontSize() / 20);
      }
      transform += "translateY(-" + px + "px)";

      textarea.style.transform = transform;

      textarea.style.height = "auto";
      textarea.style.height = textarea.scrollHeight + 3 + "px";

      textarea.focus();

      function removeTextarea() {
        textarea.parentNode.removeChild(textarea);
        window.removeEventListener("click", handleOutsideClick);
        textNode.show();
        tr.show();
        tr.forceUpdate();
      }

      function setTextareaWidth(newWidth) {
        if (!newWidth) {
          newWidth = textNode.placeholder.length * textNode.fontSize();
        }
        var isSafari = /^((?!chrome|android).)*safari/i.test(
          navigator.userAgent
        );
        var isFirefox =
          navigator.userAgent.toLowerCase().indexOf("firefox") > -1;
        if (isSafari || isFirefox) {
          newWidth = Math.ceil(newWidth);
        }

        var isEdge = document.documentMode || /Edge/.test(navigator.userAgent);
        if (isEdge) {
          newWidth += 1;
        }
        textarea.style.width = newWidth + "px";
      }

      textarea.addEventListener("keydown", function(e) {
        if (e.keyCode === 13 && !e.shiftKey) {
          textNode.text(textarea.value);
          removeTextarea();
        }
        if (e.keyCode === 27) {
          removeTextarea();
        }
      });

      textarea.addEventListener("keydown", function(e) {
        var scale = textNode.getAbsoluteScale().x;
        setTextareaWidth(textNode.width() * scale);
        textarea.style.height = "auto";
        textarea.style.height =
          textarea.scrollHeight + textNode.fontSize() + "px";
      });

      function handleOutsideClick(e) {
        if (e.target !== textarea) {
          removeTextarea();
        }
      }
      setTimeout(() => {
        window.addEventListener("click", handleOutsideClick);
      });
    },
  },
  mounted() {
    vm = this;

    layer = vm.$refs.layer.getNode();

    stage = vm.$refs.stage.getNode();

    tr = vm.$refs.transformerText.getNode();

    stage.draw();
    layer.draw();
  }
};
</script> 