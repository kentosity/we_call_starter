<script setup lang="ts">
import Row from './FormRow.vue'
</script>

<template>
    <Row>
        <p class="alt-label">性別</p>
        <div>
            <input type="radio" id="male" name="gender" value="male" />
            <label class="radio-label" for="male">男性</label>

            <input type="radio" id="female" name="gender" value="female" />
            <label class="radio-label" for="female">女性</label>

            <input type="radio" id="other" name="gender" value="other" />
            <label class="radio-label" for="other">その他</label>
        </div>
    </Row>
</template>