
import fs   from 'fs/promises'
import url  from 'url'
import yaml from 'yaml'
import handlebars from 'handlebars'

let file
let buffer
let data

try {
  // var file = await fs.open(url.fileURLToPath(import.meta.url), 'r')
  file = await fs.open(url.fileURLToPath(import.meta.url), 'r')

  // var data = (await file.readFile())
  //              .toString()
  //              .split("/* __END__\n")
  //              .slice(-1)[0]                //=> Replace this with Array.prototype.at
  //              .replace(/\*\//, '')         //   when this method will be available.
  //              // .replace(/^\/\/\s/gm, '') //   See `https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/at` for details.

  // var data = (await file.readFile())
  //              .toString()
  //              .replace(/(?<=^\/\* __END__\n).*/ms, m => `!>>>${m}<<<!`)

  // var data = (await file.readFile())
  //              .toString()
  //              .match(/(?<=^__END__$).*(?=\*\/)/ms)[0]
  buffer = await file.readFile()
  data   = buffer.toString().match(/(?<=^__END__$).*(?=\*\/)/ms)[0]
}
catch(e) {
  /* ... */
  console.err(e)
}
finally {
  await file?.close()
  // file?. to ensure that the `close` won't call if file doesn't exist
}

// fs.open(...)
//   .then(file => {
//     file.readFile()
//       .then(buffer => buffer.toString().match(...))
//       .catch(err => ...)
//   })
//   .catch(err => ...)
//   .finally(?? => ??.close())
//   how to get the file handler in order to close it in the finally handler

// fs.open(...)
//   .then(file   => file.readFile())
//   .then(buffer => buffer.toString().match(...))
//   .catch(err => ...)
//   ??? how to properly close the file

// this way
// fs.open(...)
//   .then(file => {
//     file.readFile()
//       .then(buffer => buffer.toString().match(...))
//       .catch(err => ...)
//       .finally(() => file?.close().catch(err => ...))
//   })
//   .catch(err => ...)

// or this
// fs.open(...)
//   .then( f => f.readFile()
//                 .then(b => b.toString(), e => ... )
//                 .finally(f => f.?close().catch(err => ...)),
//          e => ... )

export function main( ) {

  let { template, ...context } = yaml.parse(data)

  // let handlebars_template = handlebars.compile(template)

  // let result = handlebars_template(context)

  // let result = handlebars.compile(template, { noEscape: true })(context)
  // or use {{{ data }}} to prevent escaping html partials

  let result = handlebars.compile(template)(context)

  return result

}

/*
__END__
header: |-
  <header>
    Reflexive verb
  </header>

footer: |-
  <footer>
    Text is available under the Creative Commons Attribution-ShareAlike License.
  </footer>

content: |-
  <p>
    In grammar, a reflexive verb is, loosely, a verb whose direct object is the same as its subject; for example, "I wash myself". More generally, a reflexive verb has the same semantic agent and patient (typically represented syntactically by the subject and the direct object). For example, the English verb to perjure is reflexive, since one can only perjure oneself. In a wider sense, the term refers to any verb form whose grammatical object is a reflexive pronoun, regardless of semantics; such verbs are also referred to as pronominal verbs, especially in grammars of the Romance languages. In the Romance languages, the pronominal verbs is a parent category with reflexive verbs as only one of its sub-categories. Other kinds of pronominal verbs are reciprocal (they killed each other), passive (it is told), subjective, idiomatic. The presence of the reflexive pronoun changes the meaning of a verb, e.g. Spanish abonar to pay, abonarse to subscribe.
  </p>
  <p>
    There are languages that have explicit morphology or syntax to transform a verb into a reflexive form. In many languages, reflexive constructions are rendered by transitive verbs followed by a reflexive pronoun, as in English -self (e.g., "She threw herself to the floor.") English employs reflexive derivation in-idiosyncratically, as in "self-destruct".
  </p>
  <p>
    Romance and Slavic languages make extensive use of reflexive verbs and reflexive forms.
  </p>
  <p>
    In the Romance languages, there are non-emphatic clitic reflexive pronouns and emphatic ones. In Spanish, for example, the particle se encliticizes to the verb's infinitive, gerund, and imperative (lavarse "to wash oneself"), while in Romanian, the particle procliticizes to the verb (a se spăla "to wash oneself"). Full reflexive pronouns or pronominal phrases are added for emphasis or disambiguation: Me cuido a mí mismo "I take care of myself" (mismo combines with the prepositional form of the pronoun mí to form an intensive reflexive pronoun).
  </p>
  <p>
    The enclitic reflexive pronoun sa/se/si/się is used in Western and South Slavic languages, while Eastern Slavic languages use the suffix -sja (-ся). There is also the non-clitic emphatic pronoun sebja/себя, used to emphasize the reflexive nature of the act; it is applicable only to "true" reflexive verbs, where the agent performs a (transitive) action on itself.
  </p>
  <p>
    The Slavic languages use the same reflexive pronoun for all persons and numbers, while the Romance and North Germanic ones have a special third person pronoun that cliticizes and the other Germanic ones do as well without cliticizing. This is illustrated in the following table for the word "to recall" (e.g., Je me souviens means "I recall", Tu te souviens means "You recall", and so on).
  </p>
  <p>
    In all of these language groups, reflexive forms often present an obstacle for foreign learners (notably native speakers of English, where the feature is practically absent) due to the variety of uses. Even in languages which contain the feature, it is not always applicable to the same verbs and uses (although a common subset can be generally extracted, as outlined below). For example, the Spanish reflexive construct "se hundió el barco" ("the boat sank") has no reflexive equivalent in some Slavic languages (which use an intransitive equivalent of sink), though for example Czech and Slovak do use a reflexive verb: "loď se potopila"/"loď sa potopila". Reflexive verbs can have a variety of uses and meanings, which often escape consistent classification. Some language-common identified uses are outlined below. For example, Davies et al. identify 12 uses for Spanish reflexive constructions, while Vinogradov divides Russian reflexive verbs into as many as 16 groups.
  </p>

style: |-
  <style type='text/css'>
    body {
      margin: 0; padding: 0;
      height: 100vh;
      display: grid;
      grid-template-rows: auto 1fr auto;
    }
    header {
      font-size: 3em;
      grid-row: 1;
    }
    main {
      padding: 20px;
      grid-row: 2;
    }
    footer {
      grid-row: 3;
    }
    p {
      text-align: justify;
      hyphens: auto;
    }
    header, footer {
      background-color: darkolivegreen;
      color: white;
      padding: 20px;
    }
  </style>

template: |-
  <!doctype html>
  <html lang='en'>
    <head>
      <meta charset='utf-8' />
      <title>Sample</title>
      {{{ style }}}
    </head>
    <body>
      {{{ header }}}
      <main>
        {{{ content }}}
      </main>
      {{{ footer }}}
    </body>
  </html>
*/
