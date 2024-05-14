<script setup lang="ts">
const props = defineProps({
    msg: String
})
</script>

<template>
    <div class="row">
        <p class="caution">※{{ props.msg }}</p>
    </div>
</template>