<?php

class Irjdiagnosa extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=false)
     */
    public $rm;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $icd10;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=true)
     */
    public $dokter;

    /**
     *
     * @var string
     * @Column(type="string", length=50, nullable=true)
     */
    public $jenis;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $tanggal;

    /**
     *
     * @var string
     * @Column(type="string", length=100, nullable=false)
     */
    public $poli;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("aplous_data");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'irjdiagnosa';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Irjdiagnosa[]|Irjdiagnosa
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Irjdiagnosa
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
