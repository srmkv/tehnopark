<?php

declare(strict_types=1);

namespace PackageVersions;

use Composer\InstalledVersions;
use OutOfBoundsException;

class_exists(InstalledVersions::class);

/**
 * This class is generated by composer/package-versions-deprecated, specifically by
 * @see \PackageVersions\Installer
 *
 * This file is overwritten at every run of `composer install` or `composer update`.
 *
 * @deprecated in favor of the Composer\InstalledVersions class provided by Composer 2. Require composer-runtime-api:^2 to ensure it is present.
 */
final class Versions
{
    /**
     * @deprecated please use {@see self::rootPackageName()} instead.
     *             This constant will be removed in version 2.0.0.
     */
    const ROOT_PACKAGE_NAME = 'laravel/laravel';

    /**
     * Array of all available composer packages.
     * Dont read this array from your calling code, but use the \PackageVersions\Versions::getVersion() method instead.
     *
     * @var array<string, string>
     * @internal
     */
    const VERSIONS          = array (
  'asm89/stack-cors' => 'v2.1.1@73e5b88775c64ccc0b84fb60836b30dc9d92ac4a',
  'backpack/crud' => '4.1.71@03a0ad4a8d7182d6ee9cf9c86d784d171a942484',
  'backpack/filemanager' => '1.1.7@f3f5386cd223de964bd6644860437edfe2e580bd',
  'backpack/permissionmanager' => '6.0.11@656e8abc468a2fe6713a5ea4ad3b2e146bd8141b',
  'barryvdh/elfinder-flysystem-driver' => 'v0.3.0@5a6c893dfb97e9848d7b1e5e990e943af7bc3550',
  'barryvdh/laravel-elfinder' => 'v0.4.7@f2a5f7d2b69b7c2f5419b0b02874b91b6d480c6c',
  'brick/math' => '0.10.2@459f2781e1a08d52ee56b0b1444086e038561e3f',
  'composer/package-versions-deprecated' => '1.11.99.5@b4f54f74ef3453349c24a845d22392cd31e65f1d',
  'creativeorange/gravatar' => 'v1.0.22@0eed243a16bcd01e618036f9b8021526ea26f64a',
  'dflydev/dot-access-data' => 'v3.0.1@0992cc19268b259a39e86f296da5f0677841f42c',
  'doctrine/cache' => '2.2.0@1ca8f21980e770095a31456042471a57bc4c68fb',
  'doctrine/dbal' => '3.5.1@f38ee8aaca2d58ee88653cb34a6a3880c23f38a5',
  'doctrine/deprecations' => 'v1.0.0@0e2a4f1f8cdfc7a92ec3b01c9334898c806b30de',
  'doctrine/event-manager' => '2.0.0@750671534e0241a7c50ea5b43f67e23eb5c96f32',
  'doctrine/inflector' => '2.0.6@d9d313a36c872fd6ee06d9a6cbcf713eaa40f024',
  'doctrine/lexer' => '1.2.3@c268e882d4dbdd85e36e4ad69e02dc284f89d229',
  'dragonmantank/cron-expression' => 'v3.3.2@782ca5968ab8b954773518e9e49a6f892a34b2a8',
  'egulias/email-validator' => '2.1.25@0dbf5d78455d4d6a41d186da50adc1122ec066f4',
  'fruitcake/laravel-cors' => 'v2.2.0@783a74f5e3431d7b9805be8afb60fd0a8f743534',
  'graham-campbell/result-type' => 'v1.1.0@a878d45c1914464426dc94da61c9e1d36ae262a8',
  'guzzlehttp/guzzle' => '7.5.0@b50a2a1251152e43f6a37f0fa053e730a67d25ba',
  'guzzlehttp/promises' => '1.5.2@b94b2807d85443f9719887892882d0329d1e2598',
  'guzzlehttp/psr7' => '2.4.1@69568e4293f4fa993f3b0e51c9723e1e17c41379',
  'intervention/image' => '2.7.2@04be355f8d6734c826045d02a1079ad658322dad',
  'laravel/framework' => 'v8.83.25@b77b908a9426efa41d6286a2ef4c3adbf5398ca1',
  'laravel/sanctum' => 'v2.15.1@31fbe6f85aee080c4dc2f9b03dc6dd5d0ee72473',
  'laravel/serializable-closure' => 'v1.2.2@47afb7fae28ed29057fdca37e16a84f90cc62fae',
  'laravel/tinker' => 'v2.7.2@dff39b661e827dae6e092412f976658df82dbac5',
  'league/commonmark' => '2.3.5@84d74485fdb7074f4f9dd6f02ab957b1de513257',
  'league/config' => 'v1.1.1@a9d39eeeb6cc49d10a6e6c36f22c4c1f4a767f3e',
  'league/flysystem' => '1.1.10@3239285c825c152bcc315fe0e87d6b55f5972ed1',
  'league/flysystem-cached-adapter' => '1.0.2@7bb5cd9d996904cf43d7da8ba45a724ff8c7ef14',
  'league/mime-type-detection' => '1.11.0@ff6248ea87a9f116e78edd6002e39e5128a0d4dd',
  'monolog/monolog' => '2.8.0@720488632c590286b88b80e62aa3d3d551ad4a50',
  'nesbot/carbon' => '2.62.1@01bc4cdefe98ef58d1f9cb31bdbbddddf2a88f7a',
  'nette/schema' => 'v1.2.2@9a39cef03a5b34c7de64f551538cbba05c2be5df',
  'nette/utils' => 'v3.2.8@02a54c4c872b99e4ec05c4aec54b5a06eb0f6368',
  'nikic/php-parser' => 'v4.15.1@0ef6c55a3f47f89d7a374e6f835197a0b5fcf900',
  'opis/closure' => '3.6.3@3d81e4309d2a927abbe66df935f4bb60082805ad',
  'phpoption/phpoption' => '1.9.0@dc5ff11e274a90cc1c743f66c9ad700ce50db9ab',
  'prologue/alerts' => '0.4.8@a6412e318c0171526bc8b25ef597f2cc61f5b800',
  'psr/cache' => '3.0.0@aa5030cfa5405eccfdcb1083ce040c2cb8d253bf',
  'psr/container' => '1.1.2@513e0666f7216c7459170d56df27dfcefe1689ea',
  'psr/event-dispatcher' => '1.0.0@dbefd12671e8a14ec7f180cab83036ed26714bb0',
  'psr/http-client' => '1.0.1@2dfb5f6c5eff0e91e20e913f8c5452ed95b86621',
  'psr/http-factory' => '1.0.1@12ac7fcd07e5b077433f5f2bee95b3a771bf61be',
  'psr/http-message' => '1.0.1@f6561bf28d520154e4b0ec72be95418abe6d9363',
  'psr/log' => '2.0.0@ef29f6d262798707a9edd554e2b82517ef3a9376',
  'psr/simple-cache' => '1.0.1@408d5eafb83c57f6365a3ca330ff23aa4a5fa39b',
  'psy/psysh' => 'v0.11.8@f455acf3645262ae389b10e9beba0c358aa6994e',
  'ralouphie/getallheaders' => '3.0.3@120b605dfeb996808c31b6477290a714d356e822',
  'ramsey/collection' => '1.2.2@cccc74ee5e328031b15640b51056ee8d3bb66c0a',
  'ramsey/uuid' => '4.5.1@a161a26d917604dc6d3aa25100fddf2556e9f35d',
  'spatie/laravel-permission' => '5.5.16@e57a67b51a02cbfcd074ed68786897db1dbbf2fa',
  'studio-42/elfinder' => '2.1.61@33bee2654615db62e9b722efb4fdd2a21844fbb2',
  'swiftmailer/swiftmailer' => 'v6.3.0@8a5d5072dca8f48460fce2f4131fcc495eec654c',
  'symfony/console' => 'v5.4.14@984ea2c0f45f42dfed01d2f3987b187467c4b16d',
  'symfony/css-selector' => 'v6.1.3@0dd5e36b80e1de97f8f74ed7023ac2b837a36443',
  'symfony/deprecation-contracts' => 'v3.1.1@07f1b9cc2ffee6aaafcf4b710fbc38ff736bd918',
  'symfony/error-handler' => 'v5.4.14@5fe6d42ffeb68b094df8fdbf3acf23f391cc6be0',
  'symfony/event-dispatcher' => 'v6.1.0@a0449a7ad7daa0f7c0acd508259f80544ab5a347',
  'symfony/event-dispatcher-contracts' => 'v3.1.1@02ff5eea2f453731cfbc6bc215e456b781480448',
  'symfony/finder' => 'v5.4.11@7872a66f57caffa2916a584db1aa7f12adc76f8c',
  'symfony/http-foundation' => 'v5.4.14@e7c7b395c3a61d746919c21e915f51f0039c3f75',
  'symfony/http-kernel' => 'v5.4.14@6f77fabc1a37c2dceecc6f78cca44772705dc52f',
  'symfony/mime' => 'v5.4.14@1c118b253bb3495d81e95a6e3ec6c2766a98a0c4',
  'symfony/polyfill-ctype' => 'v1.26.0@6fd1b9a79f6e3cf65f9e679b23af304cd9e010d4',
  'symfony/polyfill-iconv' => 'v1.26.0@143f1881e655bebca1312722af8068de235ae5dc',
  'symfony/polyfill-intl-grapheme' => 'v1.26.0@433d05519ce6990bf3530fba6957499d327395c2',
  'symfony/polyfill-intl-idn' => 'v1.26.0@59a8d271f00dd0e4c2e518104cc7963f655a1aa8',
  'symfony/polyfill-intl-normalizer' => 'v1.26.0@219aa369ceff116e673852dce47c3a41794c14bd',
  'symfony/polyfill-mbstring' => 'v1.26.0@9344f9cb97f3b19424af1a21a3b0e75b0a7d8d7e',
  'symfony/polyfill-php72' => 'v1.26.0@bf44a9fd41feaac72b074de600314a93e2ae78e2',
  'symfony/polyfill-php73' => 'v1.26.0@e440d35fa0286f77fb45b79a03fedbeda9307e85',
  'symfony/polyfill-php80' => 'v1.26.0@cfa0ae98841b9e461207c13ab093d76b0fa7bace',
  'symfony/polyfill-php81' => 'v1.26.0@13f6d1271c663dc5ae9fb843a8f16521db7687a1',
  'symfony/process' => 'v5.4.11@6e75fe6874cbc7e4773d049616ab450eff537bf1',
  'symfony/routing' => 'v5.4.11@3e01ccd9b2a3a4167ba2b3c53612762300300226',
  'symfony/service-contracts' => 'v2.5.2@4b426aac47d6427cc1a1d0f7e2ac724627f5966c',
  'symfony/string' => 'v6.1.6@7e7e0ff180d4c5a6636eaad57b65092014b61864',
  'symfony/translation' => 'v6.1.6@e6cd330e5a072518f88d65148f3f165541807494',
  'symfony/translation-contracts' => 'v3.1.1@606be0f48e05116baef052f7f3abdb345c8e02cc',
  'symfony/var-dumper' => 'v5.4.14@6894d06145fefebd9a4c7272baa026a1c394a430',
  'tijsverkoyen/css-to-inline-styles' => '2.2.5@4348a3a06651827a27d989ad1d13efec6bb49b19',
  'vlucas/phpdotenv' => 'v5.5.0@1a7ea2afc49c3ee6d87061f5a233e3a035d0eae7',
  'voku/portable-ascii' => '1.6.1@87337c91b9dfacee02452244ee14ab3c43bc485a',
  'webmozart/assert' => '1.11.0@11cb2199493b2f8a3b53e7f19068fc6aac760991',
  'backpack/generators' => 'v3.1.13@ca7f840d43de6e649fd2b22ef9a37cb2459dbc21',
  'barryvdh/laravel-debugbar' => 'v3.7.0@3372ed65e6d2039d663ed19aa699956f9d346271',
  'doctrine/instantiator' => '1.4.1@10dcfce151b967d20fde1b34ae6640712c3891bc',
  'facade/flare-client-php' => '1.10.0@213fa2c69e120bca4c51ba3e82ed1834ef3f41b8',
  'facade/ignition' => '2.17.6@6acd82e986a2ecee89e2e68adfc30a1936d1ab7c',
  'facade/ignition-contracts' => '1.0.2@3c921a1cdba35b68a7f0ccffc6dffc1995b18267',
  'fakerphp/faker' => 'v1.20.0@37f751c67a5372d4e26353bd9384bc03744ec77b',
  'filp/whoops' => '2.14.5@a63e5e8f26ebbebf8ed3c5c691637325512eb0dc',
  'hamcrest/hamcrest-php' => 'v2.0.1@8c3d0a3f6af734494ad8f6fbbee0ba92422859f3',
  'laravel-shift/blueprint' => 'v2.2.0@b3877c973bf91a3fdf7363208fb068f879a946a0',
  'laravel-shift/faker-registry' => 'v0.1.0@051c1d50f428b699ee9456072f9c54cb073a006f',
  'laravel/sail' => 'v1.16.2@7d1ed5f856ec8b9708712e3fc0708fcabe114659',
  'maximebf/debugbar' => 'v1.18.1@ba0af68dd4316834701ecb30a00ce9604ced3ee9',
  'mockery/mockery' => '1.5.1@e92dcc83d5a51851baf5f5591d32cb2b16e3684e',
  'myclabs/deep-copy' => '1.11.0@14daed4296fae74d9e3201d2c4925d1acb7aa614',
  'nunomaduro/collision' => 'v5.11.0@8b610eef8582ccdc05d8f2ab23305e2d37049461',
  'phar-io/manifest' => '2.0.3@97803eca37d319dfa7826cc2437fc020857acb53',
  'phar-io/version' => '3.2.1@4f7fd7836c6f332bb2933569e566a0d6c4cbed74',
  'phpunit/php-code-coverage' => '9.2.17@aa94dc41e8661fe90c7316849907cba3007b10d8',
  'phpunit/php-file-iterator' => '3.0.6@cf1c2e7c203ac650e352f4cc675a7021e7d1b3cf',
  'phpunit/php-invoker' => '3.1.1@5a10147d0aaf65b58940a0b72f71c9ac0423cc67',
  'phpunit/php-text-template' => '2.0.4@5da5f67fc95621df9ff4c4e5a84d6a8a2acf7c28',
  'phpunit/php-timer' => '5.0.3@5a63ce20ed1b5bf577850e2c4e87f4aa902afbd2',
  'phpunit/phpunit' => '9.5.25@3e6f90ca7e3d02025b1d147bd8d4a89fd4ca8a1d',
  'sebastian/cli-parser' => '1.0.1@442e7c7e687e42adc03470c7b668bc4b2402c0b2',
  'sebastian/code-unit' => '1.0.8@1fc9f64c0927627ef78ba436c9b17d967e68e120',
  'sebastian/code-unit-reverse-lookup' => '2.0.3@ac91f01ccec49fb77bdc6fd1e548bc70f7faa3e5',
  'sebastian/comparator' => '4.0.8@fa0f136dd2334583309d32b62544682ee972b51a',
  'sebastian/complexity' => '2.0.2@739b35e53379900cc9ac327b2147867b8b6efd88',
  'sebastian/diff' => '4.0.4@3461e3fccc7cfdfc2720be910d3bd73c69be590d',
  'sebastian/environment' => '5.1.4@1b5dff7bb151a4db11d49d90e5408e4e938270f7',
  'sebastian/exporter' => '4.0.5@ac230ed27f0f98f597c8a2b6eb7ac563af5e5b9d',
  'sebastian/global-state' => '5.0.5@0ca8db5a5fc9c8646244e629625ac486fa286bf2',
  'sebastian/lines-of-code' => '1.0.3@c1c2e997aa3146983ed888ad08b15470a2e22ecc',
  'sebastian/object-enumerator' => '4.0.4@5c9eeac41b290a3712d88851518825ad78f45c71',
  'sebastian/object-reflector' => '2.0.4@b4f479ebdbf63ac605d183ece17d8d7fe49c15c7',
  'sebastian/recursion-context' => '4.0.4@cd9d8cf3c5804de4341c283ed787f099f5506172',
  'sebastian/resource-operations' => '3.0.3@0f4443cb3a1d92ce809899753bc0d5d5a8dd19a8',
  'sebastian/type' => '3.2.0@fb3fe09c5f0bae6bc27ef3ce933a1e0ed9464b6e',
  'sebastian/version' => '3.0.2@c6c1022351a901512170118436c764e473f6de8c',
  'symfony/yaml' => 'v5.4.14@e83fe9a72011f07c662da46a05603d66deeeb487',
  'theseer/tokenizer' => '1.2.1@34a41e998c2183e22995f158c581e7b5e755ab9e',
  'laravel/laravel' => 'dev-master@a84210b8de6db76fc2038531a320d46436a9cb57',
);

    private function __construct()
    {
    }

    /**
     * @psalm-pure
     *
     * @psalm-suppress ImpureMethodCall we know that {@see InstalledVersions} interaction does not
     *                                  cause any side effects here.
     */
    public static function rootPackageName() : string
    {
        if (!self::composer2ApiUsable()) {
            return self::ROOT_PACKAGE_NAME;
        }

        return InstalledVersions::getRootPackage()['name'];
    }

    /**
     * @throws OutOfBoundsException If a version cannot be located.
     *
     * @psalm-param key-of<self::VERSIONS> $packageName
     * @psalm-pure
     *
     * @psalm-suppress ImpureMethodCall we know that {@see InstalledVersions} interaction does not
     *                                  cause any side effects here.
     */
    public static function getVersion(string $packageName): string
    {
        if (self::composer2ApiUsable()) {
            return InstalledVersions::getPrettyVersion($packageName)
                . '@' . InstalledVersions::getReference($packageName);
        }

        if (isset(self::VERSIONS[$packageName])) {
            return self::VERSIONS[$packageName];
        }

        throw new OutOfBoundsException(
            'Required package "' . $packageName . '" is not installed: check your ./vendor/composer/installed.json and/or ./composer.lock files'
        );
    }

    private static function composer2ApiUsable(): bool
    {
        if (!class_exists(InstalledVersions::class, false)) {
            return false;
        }

        if (method_exists(InstalledVersions::class, 'getAllRawData')) {
            $rawData = InstalledVersions::getAllRawData();
            if (count($rawData) === 1 && count($rawData[0]) === 0) {
                return false;
            }
        } else {
            $rawData = InstalledVersions::getRawData();
            if ($rawData === null || $rawData === []) {
                return false;
            }
        }

        return true;
    }
}
