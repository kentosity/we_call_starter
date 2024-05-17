<script setup lang="ts">
import { onMounted, ref } from 'vue'

import NameInput from '@/components/formElements/NameInput.vue'
import NameKanaInput from '@/components/formElements/NameKanaInput.vue'
import GenderInput from '@/components/formElements/GenderInput.vue'
import BirthdayInput from '@/components/formElements/BirthdayInput.vue'
import PrefectureInput from '@/components/formElements/PrefectureInput.vue'
import AddressInput from '@/components/formElements/AddressInput.vue'
import EmailInput from '@/components/formElements/EmailInput.vue'
import Caution from '@/components/Caution.vue'
import Submit from '@/components/Submit.vue'

import { useFormStore } from '@/stores/registrationFormStore'
import { retrieveAccessToken } from '@/helpers/lineAuthentication'
import { retrieveExistingEntry } from '@/helpers/formRequestHandler'
import { submitCreateForm, submitUpdateForm } from '@/helpers/formSubmitHandler'

const accessToken = retrieveAccessToken()
const formStore = useFormStore()
const requestError = ref('')
let hasRecord = false

onMounted(async () => {
    const data = await retrieveExistingEntry(accessToken)
    if (data === null) return

    formStore.updateData(data)
    hasRecord = true
})

const handleFormSubmit = async () => {
    if (hasRecord) {
        submitUpdateForm(accessToken, requestError)
        return
    } 

    submitCreateForm(accessToken, requestError)
}
</script>

<template>
    <form>
        <NameInput></NameInput>

        <NameKanaInput></NameKanaInput>

        <GenderInput></GenderInput>

        <BirthdayInput></BirthdayInput>

        <PrefectureInput></PrefectureInput>

        <AddressInput></AddressInput>

        <EmailInput></EmailInput>

        <Caution :msg="'本イベントに関して、ご連絡させていただく可能性がございます。'" />

        <p v-if="requestError" class="error-message">{{ requestError }}</p>

        <Submit @submit="handleFormSubmit" />
    </form>
</template>
<style>
.error-message {
    font-size: 0.8rem;
    color: red;
}
</style>