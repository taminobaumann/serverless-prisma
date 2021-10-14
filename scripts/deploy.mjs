const {options} = require("../config");

cd('build/lambdas');
const {awsProfile} = options;
if (awsProfile && awsProfile.length > 0) {
 await $`serverless deploy --aws-profile ${awsProfile}`;
} else {
 await $`serverless deploy`;
}

