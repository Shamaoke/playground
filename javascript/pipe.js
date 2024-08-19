let pipe = value => ({ value: value, to: callback => pipe(callback(value)) })

let double = value => value * 2

let increment = value => value + 1

let result = pipe(5).to(double)
                    .to(double)
                    .to(increment)
                    .to(double)
                    .value

console.log(result)
