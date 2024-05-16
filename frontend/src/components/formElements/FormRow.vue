<script setup lang="ts">
const props = defineProps<{
    twoCol?: boolean
}>()

const conditionalClass = { "two-col": props.twoCol }
</script>


<template>
    <div class="row" :class=conditionalClass>
        <slot></slot>
    </div>
</template>
