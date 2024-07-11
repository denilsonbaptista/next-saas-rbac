import { ability } from '@saas/auth'

const userCanIviteSomeoneElse = ability.can('invite', 'User')
const userCanDeleteOtherUsers = ability.can('delete', 'User')

const userCannotDeleteOtherUsers = ability.cannot('delete', 'User')

console.log(userCanIviteSomeoneElse)
console.log(userCanDeleteOtherUsers)
console.log(userCannotDeleteOtherUsers)
